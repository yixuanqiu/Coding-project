function varargout = GA_GUI(varargin)
% GA_GUI MATLAB code for GA_GUI.fig
%      GA_GUI, by itself, creates a new GA_GUI or raises the existing
%      singleton*.
%
%      H = GA_GUI returns the handle to a new GA_GUI or the handle to
%      the existing singleton*.
%
%      GA_GUI('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in GA_GUI.M with the given input arguments.
%
%      GA_GUI('Property','Value',...) creates a new GA_GUI or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before GA_GUI_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to GA_GUI_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help GA_GUI

% Last Modified by GUIDE v2.5 21-Sep-2018 09:26:06

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @GA_GUI_OpeningFcn, ...
                   'gui_OutputFcn',  @GA_GUI_OutputFcn, ...
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


% --- Executes just before GA_GUI is made visible.
function GA_GUI_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to GA_GUI (see VARARGIN)

% Choose default command line output for GA_GUI
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes GA_GUI wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = GA_GUI_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;



function edit12_Callback(hObject, eventdata, handles)
nind=str2double(get(handles.edit12,'string')); 
if isnan(nind)||nind<0
    errordlg('Please enter a right number','Error');
end
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



function edit13_Callback(hObject, eventdata, handles)
ngenes=str2double(get(handles.edit13,'string'));
if isnan(ngenes)||ngenes<0
    errordlg('Please enter a right number','Error');
end
% hObject    handle to edit13 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit13 as text
%        str2double(get(hObject,'String')) returns contents of edit13 as a double


% --- Executes during object creation, after setting all properties.
function edit13_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit13 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit14_Callback(hObject, eventdata, handles)
Pc=str2double(get(handles.edit13,'string'));
if isnan(Pc)||Pc>1||Pc<0
    errordlg('Please enter a right number','Error');
end
% hObject    handle to edit14 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit14 as text
%        str2double(get(hObject,'String')) returns contents of edit14 as a double


% --- Executes during object creation, after setting all properties.
function edit14_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit14 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit2_Callback(hObject, eventdata, handles)
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



function edit5_Callback(hObject, eventdata, handles)
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



function edit8_Callback(hObject, eventdata, handles)
% hObject    handle to edit8 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit8 as text
%        str2double(get(hObject,'String')) returns contents of edit8 as a double


% --- Executes during object creation, after setting all properties.
function edit8_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit8 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit9_Callback(hObject, eventdata, handles)
% hObject    handle to edit9 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit9 as text
%        str2double(get(hObject,'String')) returns contents of edit9 as a double


% --- Executes during object creation, after setting all properties.
function edit9_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit9 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit10_Callback(hObject, eventdata, handles)
% hObject    handle to edit10 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit10 as text
%        str2double(get(hObject,'String')) returns contents of edit10 as a double


% --- Executes during object creation, after setting all properties.
function edit10_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit10 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



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


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
global s 
if s==0 
%clear the figure
axes(handles.axes2);
cla;
axes(handles.axes3);
cla;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%set parameters
nind=str2double(get(handles.edit12,'string'));     % Size of a chromosome population
nvar=2;     % Number of variables
ngenes=str2double(get(handles.edit13,'string'));  % Number of genes in a chromosome: each variable is represented by (ngenes/2) genes
Pc=str2double(get(handles.edit20,'string'));    % Crossover probability
Pm=str2double(get(handles.edit15,'string')); % Mutation probability
xymin=1;   % Possible minimum values of parameters "x" and "y"
xymax=7;    % Possible maximum values of parameters "x" and "y"
ngener=str2double(get(handles.edit17,'string')); % Number of generations
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


chrom=round(rand(nind,ngenes));   %generate a population of chromosome

xy=zeros(nind,nvar);   % initialize parental generation
lvar=ngenes/nvar;
%set the range of the x,y
if length(xymin)==1
    xymin=xymin*ones(1,nvar);
end
if length(xymax)==1
    xymax=xymax*ones(1,nvar);
end
% Decode. Convert the binary of vector of chromosome to decimal.
for i=1:nvar 
   xy(:,i)=chrom(:,1+lvar*(i-1):lvar*i)*[2.^(lvar-1:-1:0)]';
   xy(:,i)=xymin(i)+(xymax(i)-xymin(i))*(xy(:,i)+1)./(2^lvar+1);
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Calculation of the chromosome fitness

ObjFun = 'find_best(x,y)';
ObjV=evalObjFun(ObjFun,xy(:,1),xy(:,2));
best(1)=max(ObjV);
ave(1)=mean(ObjV);
%drawing the 3-D image,contour lin and current locations of the chromosomes on the surface of the "peak" function
[x,y]=meshgrid(xymin(1):1:xymax(1),xymin(2):1:xymax(2));
z=evalObjFun(ObjFun,x,y);
mesh(x,y,z)
axis auto;
hold;
contour(x,y,z,20);
scatter3(xy(:,1),xy(:,2),ObjV,40,'r','filled')
plot(xy(:,1),xy(:,2),'.','markersize',23)
xlabel('Parameter "x"');
ylabel('Parameter "y"');
zlabel('Chromosome fitness');
hold;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%calculation fitness
for i=1:ngener
   % Fitness evaluation
   fitness=ObjV;
   if min(ObjV)<0
      fitness=fitness-min(ObjV);
   end
   
   % Roulette wheel selection
   numsel=round(nind*(1-0.2));  % The number of chromosomes to be selected for reproduction
   cumfit=repmat(cumsum(fitness),1,numsel);
   chance=repmat(rand(1,numsel),nind,1)*cumfit(nind,1);
   [selind,n]=find(chance < cumfit & chance >= [zeros(1,numsel);cumfit(1:nind-1,:)]);
   newchrom=chrom(selind,:);

   % Crossover 
   points=round(rand(floor(numsel/2),1).*(ngenes-2))+1;
   points=points.*(rand(floor(numsel/2),1)<Pc);   
   for n=1:length(points)
      if points(n)
         newchrom(2*n-1:2*n,:)=[newchrom(2*n-1:2*n,1:points(n)),...
               flipud(newchrom(2*n-1:2*n,points(n)+1:ngenes))];
      end
   end
   
   % Mutation
   mut=find(rand(numsel,ngenes)<Pm);
   newchrom(mut)=round(rand(length(mut),1));
   
   % Fitness calculation
   newxy=zeros(numsel,nvar);
	for ind=1:nvar
   	newxy(:,ind)=newchrom(:,1+lvar*(ind-1):lvar*ind)*[2.^(lvar-1:-1:0)]';
   	newxy(:,ind)=xymin(ind)+(xymax(ind)-xymin(ind))*(newxy(:,ind)+1)./(2^lvar+1);
   end

	newObjV=evalObjFun(ObjFun,newxy(:,1),newxy(:,2));

   % Creating a new population of chromosomes
   if nind-numsel % Preserving a part of the parent chromosome population
      [ans,Index]=sort(fitness);
      chrom=[chrom(Index(numsel+1:nind),:);newchrom];
      xy=[xy(Index(numsel+1:nind),:);newxy];
      ObjV=[ObjV(Index(numsel+1:nind));newObjV];      
   else % Replacing the entire parent chromosome population with a new one
      chrom=newchrom;
      xy=newxy;
      ObjV=newObjV;
   end
 
   % Plotting current locations of the chromosomes on the surface of the"peak" function
   mesh(x,y,z)
   axis auto
   hold;
   contour(x,y,z,20)
   hold on;
   scatter3(xy(:,1),xy(:,2),ObjV,40,'r','filled')
   plot(xy(:,1),xy(:,2),'.','markersize',23)
   xlabel('Parameter "x"');
   ylabel('Parameter "y"');
   zlabel('Chromosome fitness');
   pause(0.01);
hold;

	best(1+i)=max(ObjV);
	ave(1+i)=mean(ObjV);
end
best_point = mode(newxy);% find the most frequently occurring points in all of the results
L=unique(newxy,'rows');%find the different points
W=size(L);
N=W(1,1);% find the number of the point 
set(handles.edit2,'String',N);
set(handles.edit6,'String',fix(best_point(1,1)));
set(handles.edit19,'String',fix((best_point(1,2))));

axes(handles.axes2);
plot(0:ngener,best,0:ngener,ave);
legend('Best','Average');
xlabel('Number of generations');
xlabel('Generations');
ylabel('Fitness');
end







% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
set(handles.edit12,'String','');
set(handles.edit13,'String','');
set(handles.edit20,'String','');
set(handles.edit15,'String','');
set(handles.edit17,'String','');
set(handles.edit2,'String','');
set(handles.edit6,'String','');
set(handles.edit19,'String','');

% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)



function edit15_Callback(hObject, eventdata, handles)
Pm=str2double(get(handles.edit15,'string'));
if isnan(Pm)||Pm<0||Pm>1
    errordlg('Please enter a right number','Error');
end
% hObject    handle to edit15 (see GCBO)
% eventd5ta  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit15 as text
%        str2double(get(hObject,'String')) returns contents of edit15 as a double


% --- Executes during object creation, after setting all properties.
function edit15_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit15 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit16_Callback(hObject, eventdata, handles)
% hObject    handle to edit16 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit16 as text
%        str2double(get(hObject,'String')) returns contents of edit16 as a double


% --- Executes during object creation, after setting all properties.
function edit16_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit16 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit17_Callback(hObject, eventdata, handles)
ngener=str2double(get(handles.edit17,'string')); % Number of generations
if isnan(ngener)||ngener<0
    errordlg('Please enter a right number','Error');
end
% hObject    handle to edit17 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit17 as text
%        str2double(get(hObject,'String')) returns contents of edit17 as a double


% --- Executes during object creation, after setting all properties.
function edit17_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit17 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton3.
function pushbutton3_Callback(hObject, eventdata, handles)
global s
if s==1 % choose the type of the 
%output the figure
axes(handles.axes2);
cla;
axes(handles.axes3);
cla;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%set parameters
nind=str2double(get(handles.edit12,'string'));     % Size of a chromosome population
nvar=2;     % Number of variables
ngenes=str2double(get(handles.edit13,'string'));  % Number of genes in a chromosome: each variable is represented by (ngenes/2) genes
Pc=str2double(get(handles.edit20,'string'));    % Crossover probability
Pm=str2double(get(handles.edit15,'string')); % Mutation probability
xymin=1;   % Possible minimum values of parameters "x" and "y"
xymax=7;    % Possible maximum values of parameters "x" and "y"
ngener=str2double(get(handles.edit17,'string')); % Number of generations
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
chrom=round(rand(nind,ngenes));   %generate a population of chromosome

xy=zeros(nind,nvar);   % initialize old Gene
lvar=ngenes/nvar;
%set the range of the x,y
if length(xymin)==1
    xymin=xymin*ones(1,nvar);
end
if length(xymax)==1
    xymax=xymax*ones(1,nvar);
end
% Decode. Convert the binary of vector of chromosome to decimal.
for i=1:nvar 
   xy(:,i)=chrom(:,1+lvar*(i-1):lvar*i)*[2.^(lvar-1:-1:0)]';
   xy(:,i)=xymin(i)+(xymax(i)-xymin(i))*(xy(:,i)+1)./(2^lvar+1);
end


% Calculation of the chromosome fitness
ObjFun = 'city_river(x,y)';
ObjV=evalObjFun(ObjFun,xy(:,1),xy(:,2));
best(1)=max(ObjV);
ave(1)=mean(ObjV);


%drawing the 3-D image,contour lin and current locations of the chromosomes on the surface of the "peak" function
[x,y]=meshgrid(xymin(1):1:xymax(1),xymin(2):1:xymax(2));
z=evalObjFun(ObjFun,x,y);

mesh(x,y,z)
axis auto;
contour(x,y,z,20)

scatter3(xy(:,1),xy(:,2),ObjV,40,'r','filled')
plot(xy(:,1),xy(:,2),'.','markersize',23)
xlabel('Parameter "x"');
ylabel('Parameter "y"');
zlabel('Chromosome fitness');
for i=1:ngener
   % Fitness evaluation
   fitness=ObjV;
   if min(ObjV)<0
      fitness=fitness-min(ObjV);
   end
   
   % Roulette wheel selection
   numsel=round(nind*(1-0.2));  % The number of chromosomes to be selected for reproduction
   cumfit=repmat(cumsum(fitness),1,numsel);
   chance=repmat(rand(1,numsel),nind,1)*cumfit(nind,1);
   [selind,n]=find(chance < cumfit & chance >= [zeros(1,numsel);cumfit(1:nind-1,:)]);
   newchrom=chrom(selind,:);

   % Crossover 
   points=round(rand(floor(numsel/2),1).*(ngenes-2))+1;
   points=points.*(rand(floor(numsel/2),1)<Pc);   
   for n=1:length(points)
      if points(n)
         newchrom(2*n-1:2*n,:)=[newchrom(2*n-1:2*n,1:points(n)),...
               flipud(newchrom(2*n-1:2*n,points(n)+1:ngenes))];
      end
   end
   
   % Mutation
   mut=find(rand(numsel,ngenes)<Pm);
   newchrom(mut)=round(rand(length(mut),1));
   
   % Fitness calculation
   newxy=zeros(numsel,nvar);
	for ind=1:nvar
   	newxy(:,ind)=newchrom(:,1+lvar*(ind-1):lvar*ind)*[2.^(lvar-1:-1:0)]';
   	newxy(:,ind)=xymin(ind)+(xymax(ind)-xymin(ind))*(newxy(:,ind)+1)./(2^lvar+1);
   end

	newObjV=evalObjFun(ObjFun,newxy(:,1),newxy(:,2));

   % Creating a new population of chromosomes
   if nind-numsel, % Preserving a part of the parent chromosome population
      [ans,Index]=sort(fitness);
      chrom=[chrom(Index(numsel+1:nind),:);newchrom];
      xy=[xy(Index(numsel+1:nind),:);newxy];
      ObjV=[ObjV(Index(numsel+1:nind));newObjV];      
   else % Replacing the entire parent chromosome population with a new one
      chrom=newchrom;
      xy=newxy;
      ObjV=newObjV;
   end
   
   % Plotting current locations of the chromosomes on the surface of the "peak" function
   mesh(x,y,z)
   axis auto
   hold;
   contour(x,y,z,20)

   scatter3(xy(:,1),xy(:,2),ObjV,40,'r','filled')
   plot(xy(:,1),xy(:,2),'.','markersize',23)
   xlabel('Parameter "x"');
   ylabel('Parameter "y"');
   zlabel('Chromosome fitness');
   pause(0.01);
	hold;

	best(1+i)=max(ObjV);
	ave(1+i)=mean(ObjV);
end

best_point = mode(newxy);
L=unique(newxy,'row');%find the different points
W=size(L);
N=W(1,1);% find the number of the point 
set(handles.edit2,'String',N);
set(handles.edit6,'String',fix(best_point(1,1)));
set(handles.edit19,'String',fix((best_point(1,2))));
axes(handles.axes2);
plot(0:ngener,best,0:ngener,ave);
legend('Best','Average');
xlabel('Number of generations');
xlabel('Generations');
ylabel('Fitness');
end

% hObject    handle to pushbutton3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on selection change in popupmenu1.
function popupmenu1_Callback(hObject, eventdata, handles)
val=get(hObject,'value');
axes(handles.axes6);
global s
switch val
    case 1
    case 2
        s=0;
        imshow('without_river.PNG');
    case 3
        s=1;
        imshow('with_river.PNG');
    otherwise
end
guidata(hObject,handles);

 
% hObject    handle to popupmenu1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns popupmenu1 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popupmenu1


% --- Executes during object creation, after setting all properties.
function popupmenu1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popupmenu1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes during object creation, after setting all properties.
function axes2_CreateFcn(hObject, eventdata, handles)

% hObject    handle to axes2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: place code in OpeningFcn to populate axes2



function edit19_Callback(hObject, eventdata, handles)
% hObject    handle to edit19 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit19 as text
%        str2double(get(hObject,'String')) returns contents of edit19 as a double


% --- Executes during object creation, after setting all properties.
function edit19_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit19 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit20_Callback(hObject, eventdata, handles)
Pc=str2double(get(handles.edit20,'string')); % Number of generations
if isnan(Pc)||Pc<0||Pc>=1
    errordlg('Please enter a right number','Error');
end
% hObject    handle to edit20 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit20 as text
%        str2double(get(hObject,'String')) returns contents of edit20 as a double


% --- Executes during object creation, after setting all properties.
function edit20_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit20 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
