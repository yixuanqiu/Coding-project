function varargout = ANN(varargin)
% ANN MATLAB code for ANN.fig
%      ANN, by itself, creates a new ANN or raises the existing
%      singleton*.
%
%      H = ANN returns the handle to a new ANN or the handle to
%      the existing singleton*.
%
%      ANN('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in ANN.M with the given input arguments.
%
%      ANN('Property','Value',...) creates a new ANN or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before ANN_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to ANN_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help ANN

% Last Modified by GUIDE v2.5 20-Aug-2018 21:00:35

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @ANN_OpeningFcn, ...
                   'gui_OutputFcn',  @ANN_OutputFcn, ...
                   'gui_LayoutFcn',  [] , ...
                   'gui_Callback',   []);
if nargin && ischar(varargin{1})
    gui_State.gui_Callback = str2func(varargin{1});
end

if nargout
    [varargout{1:nargout}] = gui_mainfcn(gui_State, varargin{:});
else
    gui_mainfcn(gui_State, varargin{:});
end
% End initialization code - DO NOT EDIT


% --- Executes just before ANN is made visible.
function ANN_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to ANN (see VARARGIN)

% Choose default command line output for ANN
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes ANN wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = ANN_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;



% --- Executes when uipanel2 is resized.
function uipanel2_SizeChangedFcn(hObject, eventdata, handles)
% hObject    handle to uipanel2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)



function edit11_Callback(hObject, eventdata, handles)
% hObject    handle to edit11 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit11 as text
%        str2double(get(hObject,'String')) returns contents of edit11 as a double


% --- Executes during object creation, after setting all properties.
function edit11_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit11 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit12_Callback(hObject, eventdata, handles)
% hObject    handle to edit12 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit12 as text
%        str2double(get(hObject,'String')) returns contents of edit12 as a double


% --- Executes during object creation, after setting all properties.
function edit12_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit12 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
global norm_sl norm_sw norm_pl norm_pw
load ('competitive.mat');
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%load data
raw_data = load('iris.dat')/10;
bitA = zeros(150,1);
bitB = zeros(150,1);
bitC = zeros(150,1);
dataset = [raw_data bitA bitB bitC];
 for i=1:150
     if dataset(i,5) == 0.1
        dataset(i,7)=1;
     end
if dataset(i,5) == 0.2
        dataset(i,8)=1;
end
if dataset(i,5) == 0.3
        dataset(i,6)=1;
end
 end
 
 %  randomly data
 dataset_randomised = dataset(randperm(150),:);
 input_data=(dataset_randomised(:,1:4))';
     for n=1:4
         input_data_normalised(n,:)=((input_data(n,:)-min(input_data(n,:)))/(max(input_data(n,:))-min(input_data(n,:))))
     end
 % pick input data and output data up

 target_testing=(dataset_randomised(101:150,6:8))';
 testing_set = input_data_normalised(1:4,101:150);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
COM_predict = network1([norm_sl;norm_sw;norm_pl;norm_pw]);
if ((COM_predict(1)<0.2)&&(COM_predict(2)>0.8)&&(COM_predict(3)<0.2))
    set(handles.edit11, 'String', 'Iris- Setosa');
elseif ((COM_predict(1)<0.2)&&(COM_predict(2)<0.2)&&(COM_predict(3)>0.8))
    set(handles.edit11, 'String', 'Iris-Versicolor');
elseif ((COM_predict(1)>0.8)&&(COM_predict(2)<0.2)&&(COM_predict(3)<0.2))
    set(handles.edit11, 'String', 'Iris-Virginica');
end
%error calculation
predict_data = network1(testing_set);
pre_data_int = round(predict_data);
error = pre_data_int - target_testing;
for n=1:50
    error_num_vector(1,n) = length(find(error(:,n)~=0));     
end
error_num=length(find(error_num_vector(1,:)~=0));
error_rate = (error_num/50)*100;
error_rate_persent = sprintf('%.2f',error_rate);
set(handles.edit12, 'String', error_rate_persent);

% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)



function edit6_Callback(hObject, eventdata, handles)
% hObject    handle to edit6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit6 as text
%        str2double(get(hObject,'String')) returns contents of edit6 as a double


% --- Executes during object creation, after setting all properties.
function edit6_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit7_Callback(hObject, eventdata, handles)
% hObject    handle to edit7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit7 as text
%        str2double(get(hObject,'String')) returns contents of edit7 as a double


% --- Executes during object creation, after setting all properties.
function edit7_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
load ('BPnet.mat')
global sl sw pl pw target_data input_data_normalised testing_set target_testing
global norm_sl norm_sw norm_pl norm_pw
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%load data
raw_data = load('iris.dat')/10;
bitA = zeros(150,1);
bitB = zeros(150,1);
bitC = zeros(150,1);
dataset = [raw_data bitA bitB bitC];
 for i=1:150
     if dataset(i,5) == 0.1
        dataset(i,8)=1;
     end
if dataset(i,5) == 0.2
        dataset(i,7)=1;
end
if dataset(i,5) == 0.3
        dataset(i,6)=1;
end
 end
 
 %  randomly data
 dataset_randomised = dataset(randperm(150),:);

 % pick input data and output data up
 input_data=(dataset_randomised(:,1:4))';

 target_data=(dataset_randomised(:,6:8))';
 target_testing=(dataset_randomised(101:150,6:8))';
 for n=1:4
         input_data_normalised(n,:)=((input_data(n,:)-min(input_data(n,:)))/(max(input_data(n,:))-min(input_data(n,:))))
 end
 testing_set = input_data_normalised(1:4,101:150);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
 %normalised input 
sl=str2double(get(handles.edit1,'string'));
norm_sl = ((sl-min(input_data(1,:)))/(max(input_data(1,:))-min(input_data(1,:))));
%sw
sw=str2double(get(handles.edit3,'string'));
norm_sw = ((sw-min(input_data(2,:)))/(max(input_data(2,:))-min(input_data(2,:))));
%pl
pl=str2double(get(handles.edit5,'string'));
norm_pl = ((pl-min(input_data(3,:)))/(max(input_data(3,:))-min(input_data(3,:))));
%pw
pw=str2double(get(handles.edit4,'string'));
norm_pw = ((pw-min(input_data(4,:)))/(max(input_data(4,:))-min(input_data(4,:))));
BP_predict = net([norm_sl;norm_sw;norm_pl;norm_pw]);
if ((BP_predict(1)<0.2)&&(BP_predict(2)<0.2)&&(BP_predict(3)>0.8))
    set(handles.edit6, 'String', 'Iris- Setosa');
elseif ((BP_predict(1)<0.2)&&(BP_predict(2)>0.8)&&(BP_predict(3)<0.2))
    set(handles.edit6, 'String', 'Iris-Versicolor');
elseif ((BP_predict(1)>0.8)&&(BP_predict(2)<0.2)&&(BP_predict(3)<0.2))
    set(handles.edit6, 'String', 'Iris-Virginica');
end
%error calculation
predict_data = net(testing_set);
pre_data_int = round(predict_data);
error = pre_data_int-target_testing;
for n=1:50
    error_num_vector(1,n) = length(find(error(:,n)~=0));     
end
error_num=length(find(error_num_vector(1,:)~=0));
error_rate = (error_num/50)*100;
error_rate_persent = sprintf('%.2f',error_rate);
set(handles.edit7, 'String', error_rate_persent);

if isnan(sw)
    errordlg('Please enter a number','Error');
end
if isnan(pl)
    errordlg('Please enter a number','Error');
end
if isnan(pw)
    errordlg('Please enter a number','Error');
end





% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)



function edit1_Callback(hObject, eventdata, handles)
global sl
if isnan(sl)
    errordlg('Please enter a number','Error');
end
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit1 as text
%        str2double(get(hObject,'String')) returns contents of edit1 as a double


% --- Executes during object creation, after setting all properties.
function edit1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit3_Callback(hObject, eventdata, handles)
global sw
if isnan(sw)
    errordlg('Please enter a number','Error');
end
% hObject    handle to edit3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit3 as text
%        str2double(get(hObject,'String')) returns contents of edit3 as a double


% --- Executes during object creation, after setting all properties.
function edit3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit4_Callback(hObject, eventdata, handles)
global pw
if isnan(pw)
    errordlg('Please enter a number','Error');
end
% hObject    handle to edit4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit4 as text
%        str2double(get(hObject,'String')) returns contents of edit4 as a double


% --- Executes during object creation, after setting all properties.
function edit4_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit5_Callback(hObject, eventdata, handles)
global pl
if isnan(pl)
    errordlg('Please enter a number','Error');
end
% hObject    handle to edit5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit5 as text
%        str2double(get(hObject,'String')) returns contents of edit5 as a double


% --- Executes during object creation, after setting all properties.
function edit5_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
