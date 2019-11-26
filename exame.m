function varargout = exame(varargin)
format long
% EXAME MATLAB code for exame.fig
%      EXAME, by itself, creates a new EXAME or raises the existing
%      singleton*.
%
%      H = EXAME returns the handle to a new EXAME or the handle to
%      the existing singleton*.
%
%      EXAME('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in EXAME.M with the given input arguments.
%
%      EXAME('Property','Value',...) creates a new EXAME or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before exame_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to exame_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help exame

% Last Modified by GUIDE v2.5 07-Jul-2017 10:30:04

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @exame_OpeningFcn, ...
                   'gui_OutputFcn',  @exame_OutputFcn, ...
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


% --- Executes just before exame is made visible.
function exame_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to exame (see VARARGIN)

% Choose default command line output for exame
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes exame wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = exame_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;



% Hint: place code in OpeningFcn to populate axes11




function com_Callback(hObject, eventdata, handles)
% hObject    handle to com (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of com as text
%        str2double(get(hObject,'String')) returns contents of com as a double


% --- Executes during object creation, after setting all properties.
function com_CreateFcn(hObject, eventdata, handles)
% hObject    handle to com (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function tempo_Callback(hObject, eventdata, handles)
% hObject    handle to tempo (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of tempo as text
%        str2double(get(hObject,'String')) returns contents of tempo as a double


% --- Executes during object creation, after setting all properties.
function tempo_CreateFcn(hObject, eventdata, handles)
% hObject    handle to tempo (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
%%Habilita Serial

    set(handles.r_exame, 'String',sprintf('Comunicando...Aguarde!'));
    pause(1/2);
    tempo = get(handles.tempo, 'String');
    if(length(tempo) == 0)
        tempo = '1';
    end
    tempo = eval(tempo);
    nAmostras = 30000*tempo;
    
    comport = get(handles.com, 'String');
    if(length(comport) == 0)
        comport = 'COM4';
    end

addpath('./AFE');
afeObj = AFE4400(comport);
afeObj.init();
set(handles.r_exame, 'String', sprintf('Realizando Exame!'));


afeObj.readAdcData(nAmostras, 0, handles);
[frequencia SDNN SDANN SDNNindex RMSSD SDSD] = afeObj.calculateCardFrequency();
set(handles.vfc_media, 'String', sprintf('%.1f', frequencia));
set(handles.SDNN, 'String', sprintf('%.4f', SDNN));
set(handles.SDANN, 'String', sprintf('%.4f', SDANN));
set(handles.SDNNindex, 'String', sprintf('%.4f', SDNNindex));
set(handles.RMSSD, 'String', sprintf('%.4f', RMSSD));
set(handles.SDSD, 'String', sprintf('%.4f', SDSD));

afeObj.close();
    set(handles.r_exame, 'String', sprintf('Exame concluído!'));
    led1 = afeObj.led1; 
    aled1 = afeObj.aled1; 
    led2 = afeObj.led2; 
    aled2 = afeObj.aled2; 
    led1_aled1 = afeObj.led1_aled1; 
    led2_aled2 = afeObj.led2_aled2;
   eval(sprintf('save ''Exames/%s.mat'' led1 aled1 led1_aled1 led2 aled2 led2_aled2', handles.filename));
   pause(1/2);















function r_exame_Callback(hObject, eventdata, handles)
% hObject    handle to r_exame (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of r_exame as text
%        str2double(get(hObject,'String')) returns contents of r_exame as a double


% --- Executes during object creation, after setting all properties.
function r_exame_CreateFcn(hObject, eventdata, handles)
% hObject    handle to r_exame (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit6_Callback(hObject, eventdata, handles)
% hObject    handle to edi (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edi as text
%        str2double(get(hObject,'String')) returns contents of edi as a double


% --- Executes during object creation, after setting all properties.
function edi_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edi (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function vfc_media_Callback(hObject, eventdata, handles)
% hObject    handle to vfc_media (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of vfc_media as text
%        str2double(get(hObject,'String')) returns contents of vfc_media as a double


% --- Executes during object creation, after setting all properties.
function vfc_media_CreateFcn(hObject, eventdata, handles)
% hObject    handle to vfc_media (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
