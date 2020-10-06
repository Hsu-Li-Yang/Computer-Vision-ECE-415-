function varargout = Adaptive_Thresholding_gui(varargin)
% ADAPTIVE_THRESHOLDING_GUI MATLAB code for Adaptive_Thresholding_gui.fig
%      ADAPTIVE_THRESHOLDING_GUI, by itself, creates a new ADAPTIVE_THRESHOLDING_GUI or raises the existing
%      singleton*.
%
%      H = ADAPTIVE_THRESHOLDING_GUI returns the handle to a new ADAPTIVE_THRESHOLDING_GUI or the handle to
%      the existing singleton*.
%
%      ADAPTIVE_THRESHOLDING_GUI('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in ADAPTIVE_THRESHOLDING_GUI.M with the given input arguments.
%
%      ADAPTIVE_THRESHOLDING_GUI('Property','Value',...) creates a new ADAPTIVE_THRESHOLDING_GUI or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before Adaptive_Thresholding_gui_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to Adaptive_Thresholding_gui_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help Adaptive_Thresholding_gui

% Last Modified by GUIDE v2.5 01-Oct-2019 00:57:02

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Adaptive_Thresholding_gui_OpeningFcn, ...
                   'gui_OutputFcn',  @Adaptive_Thresholding_gui_OutputFcn, ...
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


% --- Executes just before Adaptive_Thresholding_gui is made visible.
function Adaptive_Thresholding_gui_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to Adaptive_Thresholding_gui (see VARARGIN)

% Choose default command line output for Adaptive_Thresholding_gui
handles.output = hObject;
handles.output = hObject;
img = imread('image.bmp');
[H,W]=size(img);
handles.H = H;
handles.W = W;
axes(handles.axes1);
imshow(img);
axes(handles.axes2);
imshow(img);
Histogram = find_Histogram(img);
handles.img=img;
handles.Histogram = Histogram;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes Adaptive_Thresholding_gui wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = Adaptive_Thresholding_gui_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


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
[H,W]=size(img);
handles.H = H;
handles.W = W;
handles.img=img;
handles.Histogram = Histogram;
guidata(hObject,handles);


% --- Executes on slider movement.
function slider1_Callback(hObject, eventdata, handles)
% hObject    handle to slider1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
half_window = get(handles.slider1,'Value');
half_window = floor(half_window);
set(handles.text4,'String',num2str(half_window))
img_AdTHD =Adaptive_Thresholding(handles.img,handles.Histogram,half_window,1,'F');
axes(handles.axes2);
imshow(img_AdTHD,[0,255]);
% maxNumberOfImages = 168;
% set(handleToSlider, 'Min', 1);
% set(handleToSlider, 'Max', maxNumberOfImages);
% set(handleToSlider, 'Value', 1);
% set(handleToSlider, 'SliderStep', [1/(maxNumberOfImages-1) , 10/(maxNumberOfImages-1) ]);


% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider


% --- Executes during object creation, after setting all properties.
function slider1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end
