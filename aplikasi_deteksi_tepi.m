function varargout = aplikasi_deteksi_tepi(varargin)
% APLIKASI_DETEKSI_TEPI MATLAB code for aplikasi_deteksi_tepi.fig
%      APLIKASI_DETEKSI_TEPI, by itself, creates a new APLIKASI_DETEKSI_TEPI or raises the existing
%      singleton*.
%
%      H = APLIKASI_DETEKSI_TEPI returns the handle to a new APLIKASI_DETEKSI_TEPI or the handle to
%      the existing singleton*.
%
%      APLIKASI_DETEKSI_TEPI('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in APLIKASI_DETEKSI_TEPI.M with the given input arguments.
%
%      APLIKASI_DETEKSI_TEPI('Property','Value',...) creates a new APLIKASI_DETEKSI_TEPI or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before aplikasi_deteksi_tepi_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to aplikasi_deteksi_tepi_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help aplikasi_deteksi_tepi

% Last Modified by GUIDE v2.5 02-Apr-2022 12:06:52

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @aplikasi_deteksi_tepi_OpeningFcn, ...
                   'gui_OutputFcn',  @aplikasi_deteksi_tepi_OutputFcn, ...
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


% --- Executes just before aplikasi_deteksi_tepi is made visible.
function aplikasi_deteksi_tepi_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to aplikasi_deteksi_tepi (see VARARGIN)

% Choose default command line output for aplikasi_deteksi_tepi
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes aplikasi_deteksi_tepi wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = aplikasi_deteksi_tepi_OutputFcn(hObject, eventdata, handles) 
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
proyek=guidata(gcbo);
[namafile]=uigetfile({'*.jpg;*.bmp;*.tif'},'OpenImage');
I=imread(namafile);set(proyek.figure1,'CurrentAxes',proyek.axes1);
set(imagesc(I));colormap('gray');
set(proyek.axes1,'Userdata',I);

% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
proyek=guidata(gcbo);
I=get(proyek.axes1,'Userdata');
gray=rgb2gray(I);
BW = edge(gray,'Prewitt');
set(proyek.figure1,'CurrentAxes',proyek.axes2);
set(imshow(BW));
set(imagesc(BW)); colormap('gray');
set(proyek.axes2,'Userdata',BW);

% --- Executes on button press in pushbutton3.
function pushbutton3_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
proyek=guidata(gcbo);
I=get(proyek.axes1,'Userdata');
gray=rgb2gray(I);
BW=edge(gray,'Roberts');
set(proyek.figure1,'CurrentAxes',proyek.axes2);
set(imshow(BW));
set(imagesc(BW)); colormap('gray');
set(proyek.axes2,'Userdata',BW);

% --- Executes on button press in pushbutton4.
function pushbutton4_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
proyek=guidata(gcbo);
I=get(proyek.axes1,'Userdata');
gray=rgb2gray(I);
BW=edge(gray,'Canny');
set(proyek.figure1,'CurrentAxes',proyek.axes2);
set(imshow(BW));
set(imagesc(BW)); colormap('gray');
set(proyek.axes2,'Userdata',BW);

% --- Executes on button press in pushbutton5.
function pushbutton5_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
proyek=guidata(gcbo);
I=get(proyek.axes1,'Userdata');
gray=rgb2gray(I);
BW=edge(gray,'Sobel');
set(proyek.figure1,'CurrentAxes',proyek.axes2);
set(imshow(BW));
set(imagesc(BW)); colormap('gray');
set(proyek.axes2,'Userdata',BW);

% --- Executes on button press in pushbutton6.
function pushbutton6_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
proyek=guidata(gcbo);I=get(proyek.axes1,'Userdata');
gray=rgb2gray(I);
BW=edge(gray,'Log');
set(proyek.figure1,'CurrentAxes',proyek.axes2);
set(imshow(BW));
set(imagesc(BW)); colormap('gray');
set(proyek.axes2,'Userdata',BW);
