import scipy.signal as signal
import numpy as np
import matplotlib.pyplot as plt
import pandas as pd
import os
import matlab.engine
import scipy.fftpack as fftpack
from scipy import interpolate
import pywt

class signalProcess(object):
    """docstring for ClassName"""

    def __init__(self, data, eng):
        self.data = data
        self.eng = eng
        self.rate = pd.DataFrame(columns=['hr_time', 'rri', 'pr_time', 'ppi'])
        # self.out = pd.DataFrame(
        #     columns=['ecg_without_baseline', 'ecg_denoise', 'is_ecg_pk'])

    def dataConvert(self):
        # ecg = np.array(self.data['ecg'])
        # ppg = np.array(self.data['ppg'])
        # self.data['ppg'] = ecg
        # self.data['ecg'] = ppg

        time = np.linspace(0.005,180,36000)
        self.data['time'] = time


    def baselineFilter(self):
        for length in [251]:
            b = signal.remez(length, (0, 0.001,  0.01,  0.50), (0.01, 1))
            testS_fil = signal.lfilter(b, 1, self.data['ecg'])
            test_zero = signal.lfilter(b, 1, testS_fil[::-1])
            self.data['ecg_without_baseline'] = test_zero[::-1]

    def highfreqFilter(self):
        pass

    def deNoiseWithWavelet(self):

        XD, CXD, LXD = self.eng.wden(matlab.double(self.data['ecg_without_baseline'].tolist(
        )), 'rigrsure', 's', 'sln', 6, 'coif4', nargout=3)
        self.data['ecg_denoise'] = XD[0]

        XD, CXD, LXD = self.eng.wden(matlab.double(self.data['ppg'].tolist(
        )), 'rigrsure', 's', 'sln', 6, 'coif4', nargout=3)
        self.data['ppg_denoise'] = XD[0]

    def avgfilt(self,N,M):
        def avgF(narray,N):
            narray = np.array(narray)
            lenth = len(narray)
            data = np.zeros(lenth)

            if N % 2 == 0:
                raise Exception("N must be odd", N)
            if lenth < N:
                return narray


            pre = narray[1:N//2+1]
            after = narray[-1-N//2:-1][::-1]
            narray = np.insert(narray,0,pre)
            narray = np.append(narray,after)

            for pos in range(lenth):
                data[pos] = np.mean(narray[pos:pos+1+N//2+N//2])
            return data
        self.data['ppg_smt'] = avgF(self.data['ppg_denoise'],M)
        self.data['ecg_smt'] = avgF(self.data['ecg_denoise'],N)
        

    def peakFindECG(self):
        a = self.data['ecg_denoise'].tolist()
        a.insert(0, a[0] - 1)
        a.append(a[-1] + 1)
        v_r = np.diff(a[1:]) + np.diff(a[:-1])

        segment = 0
        WINDOW_LENTH = 1024

        MAX_LAST = 0
        # v_H = signal.hilbert(v_r).imag

        v_H = np.abs(signal.hilbert(v_r))

        MARKER = np.zeros(len(v_H))

        while (segment + 1) * WINDOW_LENTH <= len(v_H):
            rms = np.sqrt(
                np.sum(v_H[segment * WINDOW_LENTH:(segment + 1) * WINDOW_LENTH]**2) / WINDOW_LENTH)
            max_now = np.max(v_H[segment * WINDOW_LENTH:(segment + 1) * WINDOW_LENTH])


            if rms > 0.18 * max_now and max_now <= 2 * MAX_LAST:
                thr = 0.39 * max_now
            if rms > 0.18 * max_now and max_now > 2 * MAX_LAST:
                thr = 0.39 * MAX_LAST
            if rms <= 0.18 * max_now:
                thr = 1.6 * rms


            # thr = rms * 1.31

 
            for x in range(segment * 1024, (segment + 1) * 1024):
                if(v_H[x] > thr):
                    MARKER[x] = 1

            segment = segment + 1


        window = 70
        for pk in range(len(MARKER)):
            if MARKER[pk] == 1:
                if pk - window < 0:
                    segment = self.data['ecg_denoise'][
                        0:pk + window + 1] * MARKER[0:pk + window + 1]
                if pk + window > len(MARKER):
                    segment = self.data['ecg_denoise'][
                        pk - window:] * MARKER[pk - window:]
                if pk - window >= 0 and pk + window <= len(MARKER):
                    segment = self.data['ecg_denoise'][pk - window:pk +
                                                       window + 1] * MARKER[pk - window:pk + window + 1]
                if self.data['ecg_denoise'][pk] != np.max(segment):
                    MARKER[pk] = 0
        self.data['is_ecg_pk'] = MARKER


    def peakFindPPG(self):
        ecg_pks = self.data[(self.data['is_ecg_pk'] == 1)].index
        self.data['is_ppg_pk'] = np.zeros(
            len(self.data['is_ecg_pk']), dtype='int')

        for i in range(len(ecg_pks) - 1):
            max_ppg = self.data.loc[ecg_pks[i]:ecg_pks[i + 1]]['ppg'].max()
            mean = self.data.loc[ecg_pks[i]:ecg_pks[i + 1]
                                 ][(self.data['ppg'] == max_ppg)]['time'].mean()
            for item in self.data.loc[ecg_pks[i]:ecg_pks[i + 1]]['time']:

                if mean <= item:
                    self.data.loc[self.data['time'] == item, 'is_ppg_pk'] = 1
                    break

    def calInterval(self):
        data_cut = self.data.iloc[0:18000]
        hr_timeline = data_cut[
            data_cut['is_ecg_pk'] == 1]['time']
        hr_timeline = np.array(hr_timeline)
        rri = np.diff(hr_timeline)

        pg_timeline = data_cut[
            data_cut['is_ppg_pk'] == 1]['time']
        ppi = np.diff(pg_timeline)
        pg_timeline = np.array(pg_timeline)

        if pg_timeline[0] < hr_timeline[0]:
            pg_timeline = pg_timeline[1:]
            ppi = ppi[1:]

        if len(ppi) == len(rri):
            self.rate = pd.DataFrame({'hr_time': hr_timeline[
                                     :-1], 'rri': rri[:], 'pr_time': pg_timeline[:-1], 'ppi': ppi})
        else:
            self.rate = pd.DataFrame({'hr_time': hr_timeline[
                                     :-2], 'rri': rri[:-1], 'pr_time': pg_timeline[:-1], 'ppi': ppi})


    def peakSupplement(self):
        indxArr = self.rate[self.rate['ppi'] > np.mean(
            self.rate['ppi']) * 1.39]['pr_time'].index  
        for i in range(len(indxArr)):

            start_tm = self.rate.loc[indxArr[i]]['pr_time']

            end_tm = self.rate.loc[indxArr[i] + 1]['pr_time']

            start_idx = self.data[self.data['time'] == start_tm].index
            end_idx = self.data[self.data['time'] == end_tm].index

            pk_supp_ppg = self.data.loc[
                start_idx[0] + 20:end_idx[0] - 20]['ppg'].max()

            mean = self.data.loc[start_idx[0] + 20:end_idx[0] -
                                 20][(self.data['ppg'] == pk_supp_ppg)]['time'].mean()
            for item in self.data.loc[start_idx[0] + 20:end_idx[0] - 20]['time']:

                if mean <= item:
                    self.data.loc[self.data['time'] == item, 'is_ppg_pk'] = 1
                    break


        indxArr = self.rate[self.rate['rri'] > np.mean(
            self.rate['rri']) * 1.39]['hr_time'].index  # 一个数组
        for i in range(len(indxArr)):

            start_tm = self.rate.loc[indxArr[i]]['hr_time']

            end_tm = self.rate.loc[indxArr[i] + 1]['hr_time']

            start_idx = self.data[self.data['time'] == start_tm].index
            end_idx = self.data[self.data['time'] == end_tm].index

            pk_supp_ppg = self.data.loc[
                start_idx[0] + 30:end_idx[0] - 30]['ecg_without_baseline'].max()

            mean = self.data.loc[start_idx[0] + 30:end_idx[0] -
                                 30][(self.data['ecg_without_baseline'] == pk_supp_ppg)]['time'].mean()
            for item in self.data.loc[start_idx[0] + 30:end_idx[0] - 30]['time']:

                if mean <= item:
                    self.data.loc[self.data['time'] == item, 'is_ecg_pk'] = 1
                    break

        self.calInterval()


    def calFeature(self):

        def features(series, type):

            pNN50 = len(np.extract(np.diff(series['interval']) > 0.05, np.diff(
                series['interval']))) / (len(series['interval']) - 1)
            MeanRR = np.mean(series['interval']) * 1000  # ms
            SDNN = np.std(series['interval']) * 1000  # ms
            RMSSD = np.sqrt(np.mean(np.diff(series['interval'])**2))  # ms
            gradu = matlab.double(np.linspace(0, 90, num=360).tolist())
            interval_i = self.eng.interp1(matlab.double(
                series['time'].tolist()), matlab.double(series['interval'].tolist()), gradu, 'spline')

            interval_without_vlf = self.eng.detrend_Mika(interval_i[0])
            SPD, f = self.eng.pburg(interval_i[
                        0][:360-8], 19, 352, 4, nargout=2)
            SPD = np.array(SPD).flatten()
            f = np.array(f).flatten()
            
            
            x= np.linspace(0,2,2001)
            interplt = interpolate.interp1d(f,SPD,kind="nearest")
            y=interplt(x)
            
            
    #         plt.figure(figsize=(8,4.5))
    #         plt.plot(f[3:],SPD[3:])
    #         plt.show()
            

            df = 0.001

            VLF = np.sum(y[3:40]) * df

            LF = np.sum(y[40:150]) * df

            HF = np.sum(y[150:400]) * df
            # LF/HF ratio
            LHR = float(LF / HF)
            
            TF = VLF + LF + HF
            itv = np.array(interval_i[0][:352]).flatten()
            wd = pywt.wavedec(itv,'coif4', mode='sym', level=3)
            wv1 = np.sum(np.square(wd[0]))
            wv2 = np.sum(np.square(wd[1]))
            
            
    #         plt.figure(figsize=(16,9))
    # #         for x in wd:
    # #             plt.plot(x)
    # #             break
    # #         plt.show()

            if type == 'p':
                ppgPeak = []
                for x in self.rate['pr_time']:
                    ppgPeak.append(np.float(self.data['ppg_denoise'][self.data['time'] == x]))

                xp = np.linspace(0, 85, num=340) #640
                inp = interpolate.interp1d(series['time'],ppgPeak,kind='cubic')
                yp = inp(xp)

                ypmat = matlab.double(yp.tolist())
                
                SPDp, fp = self.eng.pburg(self.eng.detrend_Mika(ypmat)[0], 19, 340, 4, nargout=2)
                
                #37
                #62
                fp = np.array(fp).flatten()
                SPDp = np.array(SPDp).flatten()
                
                rLF = np.sum(SPDp[:19])*(SPDp[2]-SPDp[1])  #0.53125
                rMF = np.sum(SPDp[19:33])*(SPDp[2]-SPDp[1])
                rHF = np.sum(SPDp[33:340])*(SPDp[2]-SPDp[1])
                
                
            if type == 'e':
                rLF = 0
                rMF = 0
                rHF = 0
                
            insertPD = pd.DataFrame([[MeanRR, SDNN, RMSSD, pNN50, VLF, LF, HF, TF,LHR,rLF,rMF,rHF, wv1,wv2,type]], columns=[
                'MeanRR', 'SDNN', 'RMSSD', 'pNN50', 'VLF', 'LF', 'HF', 'TF','LHR','rLF','rMF','rHF','wv1','wv2','type'])
            #0.003125 * 10
            return insertPD

        ppgPD = features(series={'time': self.rate[
            'pr_time'] - self.rate['pr_time'][0], 'interval': self.rate['ppi']}, type='p')
        ecgPD = features(series={'time': self.rate[
            'hr_time'] - self.rate['hr_time'][0], 'interval': self.rate['rri']}, type='e')
        
        return ppgPD.append(ecgPD, ignore_index=True)