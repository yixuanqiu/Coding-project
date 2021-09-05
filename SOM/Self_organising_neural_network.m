function varargout = Self_organising_neural_network(varargin)
% SELF_ORGANISING_NEURAL_NETWORK MATLAB code for Self_organising_neural_network.fig
%      SELF_ORGANISING_NEURAL_NETWORK, by itself, creates a new SELF_ORGANISING_NEURAL_NETWORK or raises the existing
%      singleton*.
%
%      H = SELF_ORGANISING_NEURAL_NETWORK returns the handle to a new SELF_ORGANISING_NEURAL_NETWORK or the handle to
%      the existing singleton*.
%
%      SELF_ORGANISING_NEURAL_NETWORK('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in SELF_ORGANISING_NEURAL_NETWORK.M with the given input arguments.
%
%      SELF_ORGANISING_NEURAL_NETWORK('Property','Value',...) creates a new SELF_ORGANISING_NEURAL_NETWORK or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before Self_organising_neural_network_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to Self_organising_neural_network_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help Self_organising_neural_network

% Last Modified by GUIDE v2.5 12-Oct-2018 10:19:37

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Self_organising_neural_network_OpeningFcn, ...
                   'gui_OutputFcn',  @Self_organising_neural_network_OutputFcn, ...
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


% --- Executes just before Self_organising_neural_network is made visible.
function Self_organising_neural_network_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to Self_organising_neural_network (see VARARGIN)

% Choose default command line output for Self_organising_neural_network
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes Self_organising_neural_network wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = Self_organising_neural_network_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;



function edit1_Callback(hObject, eventdata, handles)
NITA=str2double(get(handles.edit1,'string')); 
if isnan(NITA)
    errordlg('Please enter a right number','Error');
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



function edit2_Callback(hObject, eventdata, handles)
NLLAA=str2double(get(handles.edit2,'string')); 
if isnan(NLLAA)
    errordlg('Please enter a right number','Error');
end
% hObject    handle to edit2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit2 as text
%        str2double(get(hObject,'String')) returns contents of edit2 as a double


% --- Executes during object creation, after setting all properties.
function edit2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit3_Callback(hObject, eventdata, handles)
NLLTL=str2double(get(handles.edit3,'string')); 
if isnan(NLLTL)
    errordlg('Please enter a right number','Error');
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
NLLPLLNI=str2double(get(handles.edit4,'string')); 
if isnan(NLLPLLNI)
    errordlg('Please enter a right number','Error');
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
NPLTA=str2double(get(handles.edit5,'string')); 
if isnan(NPLTA)
    errordlg('Please enter a right number','Error');
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


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
%get the input number
NITA = str2double(get(handles.edit1,'string'));
NLLAA = str2double(get(handles.edit2,'string'));
NPLTA = str2double(get(handles.edit5,'string'));
NLLTL = str2double(get(handles.edit3,'string'));
NLLPLLNI = str2double(get(handles.edit4,'string'));
test_data_1 = [NITA;NLLAA;NPLTA;NLLTL;NLLPLLNI];
% load data
[r1,r2,r3]=Bank_data();
Bank_data_2 = [r1;r2;r3];
Bank_data_3 = [Bank_data_2(:,(2:6))]';

  % normalise the input data
     for n=1:5
         input_nor_bank(n,:)=(test_data_1(n)-min(Bank_data_3(n,:)))/(max(Bank_data_3(n,:))-min(Bank_data_3(n,:)))
     end  
load('network5','net');%load trained network
y = net(input_nor_bank);   %output class
classes = vec2ind(y); 
cluster_bad = [3,4,19,20,25,10,21,14,15,16,9,5]; %label the clusters
gui = any(classes == cluster_bad);
%define the clusters
%based on the analysis, the output is neural 3,4,5,9,10,15
%which means these classes is bad banks. 
if gui==1
     set(handles.edit6,'string','bad');
else
     set(handles.edit6,'string','healthy');
end   





% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)



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


% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)

%get the input number
NITA = str2double(get(handles.edit1,'string'));
NLLAA = str2double(get(handles.edit2,'string'));
NPLTA = str2double(get(handles.edit5,'string'));
NLLTL = str2double(get(handles.edit3,'string'));
NLLPLLNI = str2double(get(handles.edit4,'string'));
test_data_1 = [NITA;NLLAA;NPLTA;NLLTL;NLLPLLNI];
% load data
[r1,r2,r3]=Bank_data();
Bank_data_2 = [r1;r2;r3];
Bank_data_3 = [Bank_data_2(:,(2:6))]';

  % normalise the input data
     for n=1:5
         input_nor_bank(n,:)=(test_data_1(n)-min(Bank_data_3(n,:)))/(max(Bank_data_3(n,:))-min(Bank_data_3(n,:)))
     end 
load('network2','net');%run trained network
y = net(input_nor_bank);   %output class
classes = vec2ind(y); 
cluster_bad = [4];%label the clusters
gui = any(classes == cluster_bad);  
%define the clusters
%based on the analysis, the output is neural 3,4,5,9,10,15
%which means these classes is bad banks. 
if gui==1
     set(handles.edit6,'string','bad');
else
     set(handles.edit6,'string','healthy');
end   
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
