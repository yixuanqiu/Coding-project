import multiprocessing
import os, time, random,sys
import serial
import datetime
import pandas as pd

from PyQt5 import QtCore, QtWidgets
from PyQt5.QtWidgets import QApplication, QMainWindow, QMenu, QVBoxLayout, QHBoxLayout, QSizePolicy, QWidget, \
    QTextBrowser, QLineEdit,QPushButton
import numpy as np
from matplotlib.backends.backend_qt5agg import FigureCanvasQTAgg as FigureCanvas
from matplotlib.figure import Figure
from matplotlib.animation import FuncAnimation
import matplotlib.pyplot as plt
import time
from multiprocessing import Process
class Thread(QtCore.QThread):
    def __init__(self,counter,p,strPort,mw):
        self.counter=counter
        self.p=p
        self.strPort=strPort
        self.mw=mw
        super(Thread, self).__init__()
        self.counter
    def do(self,counter,p,strPort,mw):
        try:
            nowSec = 0
            ser = serial.Serial(strPort, 115200)
            ser.flush()
            DISPLAY_LENTH = 400
            randomQue = [[],[],[],[]]
            while counter > 0:
                if counter % 20 == 0:
                    if len(randomQue[0]) > DISPLAY_LENTH:
                        for i in range(len(randomQue)):
                            p[i] = randomQue[i][-DISPLAY_LENTH:]
                    else:
                        for i in range(len(randomQue)):
                            p[i] = randomQue[i][-DISPLAY_LENTH:]
                # read data
                try:
                    data = ser.readline()
                    # read 10 data for each time 
                    data = str(data, encoding = "utf-8")
                    if len(data) <= 50:
                        data = ser.readline()
                        data = str(data,encoding = "utf-8")
                    data = data[:-3]
                    array = data.split('E')
                    for x in range(len(array)):
                        array[x] = array[x].split('x')
                        for q in range(len(randomQue)):
                            randomQue[q].append(int(array[x][q]))
                    # if (tock - tick) * 1000 >= 8:
                    #     print(tock-tick)

                except KeyboardInterrupt:
                    print('exiting')


                counter -= 10
                ktick = int(randomQue[0][-1])/1000

                if ktick != nowSec:
                    print("Already Done For %d Seconds" % (ktick))
                    nowSec = ktick


            dicForStore = {'tme':randomQue[0],'ppg':randomQue[1],'ecg':randomQue[2], }  # 'gsr':randomQue[3]
            f = pd.DataFrame(dicForStore)
            nowtime = datetime.datetime.now()
            strtime = ("File_%s.csv" % nowtime)
            f.to_csv(strtime,index=False)
            print('Record successfully!'+ strtime)
            mw.show_msg('Record successfully!'+ strtime)
        except Exception as e:
            print('error')

    def run(self):
        self.do(self.counter,self.p,self.strPort,self.mw)
class MyMplCanvas(FigureCanvas):

    def __init__(self, parent=None, width=5, height=4, dpi=100,mw=None):
        self.mw=mw
        self.fig = Figure(figsize=(width, height), dpi=dpi)
        #self.self.ax = fig.add_subplot(1, 1, 1)
        self.fig, self.ax = plt.subplots()
        FigureCanvas.__init__(self, self.fig)
        self.setParent(parent)
        FigureCanvas.setSizePolicy(self,
                                   QtWidgets.QSizePolicy.Expanding,
                                   QtWidgets.QSizePolicy.Expanding)
        FigureCanvas.updateGeometry(self)
        self.DISPLAY_LENTH = 400
        self.ax.set_xlim(0, self.DISPLAY_LENTH)
        self.ax.set_ylim(100, 800)
        self.x = np.arange(0, self.DISPLAY_LENTH, 1)
        self.line1, = self.ax.plot(self.x, np.sin(self.x))
        self.line2,=self.ax.plot(self.x, np.sin(self.x))
        self.line3, = self.ax.plot(self.x, np.sin(self.x))
        self.line4, = self.ax.plot(self.x, np.sin(self.x))

        self.run=False

        m = multiprocessing.Manager()
        self.d = m.dict()
        self.p=self.d
        # change port
        self.port = '/dev/cu.usbmodem1421'
        # sampling rate*60sec*3min
    def animation(self,i):
        randomQue= self.p[0]
        randomQue2 = self.p[1]
        randomQue3 = self.p[2]
        randomQue4 = self.p[3]
        if len(randomQue) >= self.DISPLAY_LENTH:
            self.line1.set_ydata(randomQue[-self.DISPLAY_LENTH:])
            self.line2.set_ydata(randomQue2[-self.DISPLAY_LENTH:])
            self.line3.set_ydata(randomQue3[-self.DISPLAY_LENTH:])
            self.line4.set_ydata(randomQue4[-self.DISPLAY_LENTH:])
            return self.line1, self.line2, self.line3, self.line4,
        else:
            self.line1.set_ydata([0.5]*self.DISPLAY_LENTH)
            self.line2.set_ydata([0.5] * self.DISPLAY_LENTH)
            self.line3.set_ydata([0.5] * self.DISPLAY_LENTH)
            self.line4.set_ydata([0.5] * self.DISPLAY_LENTH)
            return self.line1, self.line2, self.line3, self.line4,
    def init_func(self):
        self.line2.set_ydata(np.sin(self.x))
        self.line1.set_ydata(np.sin(self.x+10))
        return self.line2, self.line1,
    def start(self):
        if self.run == False:
            self.th = Thread(200 * 60 * 3, self.d, self.port,self.mw)
            self.th.start()

            time.sleep(1)
            # self.ani = FuncAnimation(fig=fig, func=self.animation, frames=100#100帧重复播放, init_func=self.init_func, interval=20,blit=False#更新变化值)
            self.ani = FuncAnimation(fig=self.fig,func=self.animation,init_func=self.init_func,interval=20,blit=False)
            self.ani._start()
            self.run = True
    def stop(self):
        if self.run==True:
            self.ani._stop()
            self.run=False

class ApplicationWindow(QtWidgets.QDialog):
    def __init__(self):
        super().__init__()
        self.setAttribute(QtCore.Qt.WA_DeleteOnClose)
        self.setWindowTitle("application main window")
        vbox = QtWidgets.QVBoxLayout()

        self.canvas = MyMplCanvas(width=6, height=6, dpi=100,mw=self)  ###attention###
        vbox.addWidget(self.canvas)

        hbox = QtWidgets.QHBoxLayout()
        self.btn_start=QPushButton('start')
        self.btn_start.clicked.connect(self.click_btn_start)
        self.btn_stop=QPushButton('stop')
        self.btn_stop.clicked.connect(self.click_btn_stop)
        vbox.addWidget(self.btn_start)
        vbox.addWidget(self.btn_stop)
        self.setLayout(vbox)

    def click_btn_start(self):
        self.canvas.start()
    def click_btn_stop(self):
        self.canvas.stop()
    def show_msg(self,s):
        QtWidgets.QMessageBox.information(self, 'Notification', s, QtWidgets.QMessageBox.Yes)
if __name__ == "__main__":
    App = QApplication(sys.argv)
    aw = ApplicationWindow()
    aw.show()
    App.exit()
    sys.exit(App.exec_())