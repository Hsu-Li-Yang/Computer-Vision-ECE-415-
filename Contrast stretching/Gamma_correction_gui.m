function varargout = Gamma_correction_gui(varargin)
% GAMMA_CORRECTION_GUI MATLAB code for Gamma_correction_gui.fig
%      GAMMA_CORRECTION_GUI, by itself, creates a new GAMMA_CORRECTION_GUI or raises the existing
%      singleton*.
%
%      H = GAMMA_CORRECTION_GUI returns the handle to a new GAMMA_CORRECTION_GUI or the handle to
%      the existing singleton*.
%
%      GAMMA_CORRECTION_GUI('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in GAMMA_CORRECTION_GUI.M with the given input arguments.
%
%      GAMMA_CORRECTION_GUI('Property','Value',...) creates a new GAMMA_CORRECTION_GUI or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before Gamma_correction_gui_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to Gamma_correction_gui_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help Gamma_correction_gui

% Last Modified by GUIDE v2.5 30-Sep-2019 23:30:00

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Gamma_correction_gui_OpeningFcn, ...
                   'gui_OutputFcn',  @Gamma_correction_gui_OutputFcn, ...
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


% --- Executes just before Gamma_correction_gui is made visible.
function Gamma_correction_gui_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to Gamma_correction_gui (see VARARGIN)

% Choose default command line output for Gamma_correction_gui

handles.output = hObject;
img = imread('image.bmp');
axes(handles.axes1);
imshow(img);
axes(handles.axes2);
imshow(img);
Histogram = find_Histogram(img);
handles.img=img;
handles.Histogram = Histogram;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes Gamma_correction_gui wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = Gamma_correction_gui_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on slider movement.
function slider2_Callback(hObject, eventdata, handles)
% hObject    handle to slider2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
gamma  = get(handles.slider2,'Value');
set(handles.text4,'String',num2str(gamma,2));
img_gamma = gamma_correction(handles.img,1,gamma,handles.Histogram,'F');
axes(handles.axes2);
imshow(img_gamma,[0,255]);


% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider


% --- Executes during object creation, after setting all properties.
function slider2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
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


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
[FileName,FileFolder] = uigetfile({'*.bmp;*.png;*.jpeg','Picture Files(*.bmp,*.png,*.jpeg)'},'Input Image');

img = imread([FileFolder,FileName]);
if length(size(img))>2
    img = rgb2gray(img);
end
axes(handles.axes1);
imshow(img);
axes(handles.axes2);
imshow(img);
Histogram = find_Histogram(img);
handles.img=img;
handles.Histogram = Histogram;
guidata(hObject,handles);
