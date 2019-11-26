function varargout = interface(varargin)
% INTERFACE MATLAB code for interface.fig
%      INTERFACE, by itself, creates a new INTERFACE or raises the existing
%      singleton*.
%
%      H = INTERFACE returns the handle to a new INTERFACE or the handle to
%      the existing singleton*.
%
%      INTERFACE('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in INTERFACE.M with the given input arguments.
%
%      INTERFACE('Property','Value',...) creates a new INTERFACE or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before interface_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to interface_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help interface

% Last Modified by GUIDE v2.5 07-Jul-2017 11:13:48

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @interface_OpeningFcn, ...
                   'gui_OutputFcn',  @interface_OutputFcn, ...
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


% --- Executes just before interface is made visible.
function interface_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data_exame (see GUIDATA)
% varargin   command line arguments to interface (see VARARGIN)

% Choose default command line output for interface
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes interface wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = interface_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data_exame (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;





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



function nome_medico_Callback(hObject, eventdata, handles)
% hObject    handle to nome_medico (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data_exame (see GUIDATA)

% Hints: get(hObject,'String') returns contents of nome_medico as text
%        str2double(get(hObject,'String')) returns contents of nome_medico as a double


% --- Executes during object creation, after setting all properties.
function nome_medico_CreateFcn(hObject, eventdata, handles)
% hObject    handle to nome_medico (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function nome_paciente_Callback(hObject, eventdata, handles)
% hObject    handle to nome_paciente (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data_exame (see GUIDATA)

% Hints: get(hObject,'String') returns contents of nome_paciente as text
%        str2double(get(hObject,'String')) returns contents of nome_paciente as a double


% --- Executes during object creation, after setting all properties.
function nome_paciente_CreateFcn(hObject, eventdata, handles)
% hObject    handle to nome_paciente (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


function hora_exame_Callback(hObject, eventdata, handles)
% hObject    handle to hora_exame (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data_exame (see GUIDATA)

% Hints: get(hObject,'String') returns contents of hora_exame as text
%        str2double(get(hObject,'String')) returns contents of hora_exame as a double


% --- Executes during object creation, after setting all properties.
function hora_exame_CreateFcn(hObject, eventdata, handles)
% hObject    handle to hora_exame (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function data_exame_Callback(hObject, eventdata, handles)
% hObject    handle to data_exame (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data_exame (see GUIDATA)

% Hints: get(hObject,'String') returns contents of data_exame as text
%        str2double(get(hObject,'String')) returns contents of data_exame as a double


% --- Executes during object creation, after setting all properties.
function data_exame_CreateFcn(hObject, eventdata, handles)
% hObject    handle to data_exame (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in encerrar.
function encerrar_Callback(hObject, eventdata, handles)
% hObject    handle to encerrar (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data_exame (see GUIDATA)
close(interface);

% --- Executes on button press in proximo.
function proximo_Callback(hObject, eventdata, handles)
% hObject    handle to proximo (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data_exame (see GUIDATA)
nome_medico = get(handles.nome_medico, 'String');
nome_paciente = get(handles.nome_paciente, 'String');
data_exame = get(handles.data_exame, 'String');
hora_exame = get(handles.hora_exame, 'String');

set(handles.nome_medico, 'String', '');
set(handles.nome_paciente, 'String', '');
set(handles.data_exame, 'String', '');
set(handles.hora_exame, 'String', '');

if (length(nome_medico) == 0)
        set(handles.nome_medico, 'String', 'Campo nao preenchido!');        
end

if(length(nome_paciente) == 0)
    set(handles.nome_paciente, 'String', 'Campo não preenchido!');
end

if(length(data_exame) == 0)
    set(handles.data_exame, 'String', 'Campo não preenchido!');
end

if(length(hora_exame) == 0)
    set(handles.hora_exame, 'String', 'Campo não preenchido!');
end

if(length(nome_medico) & length(nome_paciente) & length(data_exame) & length(hora_exame))  
      % verifica quem é o maior id do arquivo.
   fid = fopen('Cadastros/cadastros.csv', 'r');
   nLines = 0;
      if(fid ~= -1)
         tline = fgets(fid);
         fclose(fid);
      end
   fid = fopen('Cadastros/cadastros.csv', 'a+');
   registro = sprintf('%s;%s;%s;%s\n',nLines + 1,nome_medico, nome_paciente, data_exame, hora_exame);
   fprintf(fid, registro);
   fclose(fid);
        
   file_name = sprintf('%d', nLines + 1);
     
   set(handles.figure1, 'Visible', 'off');
   fig = openfig('exame.fig');
   close(interface);
   hand = guihandles(fig);
   hand.filename = file_name;
   guidata(fig, hand);
    
 end

% --- Executes during object creation, after setting all properties.
function axes16_CreateFcn(hObject, eventdata, handles)
% hObject    handle to axes16 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
im10= imread('Imagens/ifce.jpeg');
imshow(im10);
% Hint: place code in OpeningFcn to populate axes16


% --- Executes during object creation, after setting all properties.
function axes17_CreateFcn(hObject, eventdata, handles)
% hObject    handle to axes17 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
im4 = imread('Imagens/ppget.jpeg');
imshow(im4)
% Hint: place code in OpeningFcn to populate axes17


% --- Executes during object creation, after setting all properties.
function axes18_CreateFcn(hObject, eventdata, handles)
% hObject    handle to axes18 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
im2 = imread('Imagens/cnpq.png');
imshow(im2);
% Hint: place code in OpeningFcn to populate axes18


% --- Executes during object creation, after setting all properties.
function axes19_CreateFcn(hObject, eventdata, handles)
% hObject    handle to axes19 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
im3 = imread('Imagens/HM.jpeg');
imshow(im3);
% Hint: place code in OpeningFcn to populate axes19


% --- Executes during object creation, after setting all properties.
function axes20_CreateFcn(hObject, eventdata, handles)
% hObject    handle to axes20 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
im4 = imread('Imagens/1.png');
imshow(im4);
% Hint: place code in OpeningFcn to populate axes20
