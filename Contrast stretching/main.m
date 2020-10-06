    clc;close all;clear all;
%%
%load image
X = imread('./Image.bmp');
fig = figure('color','w','outerposition',get(0,'screensize'));
imshow(X,[0,255]);
title('Original image')
set(gca,'linewidth',1,'FontSize',15,'fontname','Times New Roman')
if ~exist('plot', 'dir')
    mkdir('plot')
end
fig_savename=['./plot/' ,'original.tif'];
h=getframe(fig);
imwrite(h.cdata,fig_savename);
m=7;
c=1;
gamma = 1/2.2;
%%
Histogram = find_Histogram(X);
%%
img_THD =Thresholding(X,Histogram);
img_AdTHD =Adaptive_Thresholding(X,Histogram,m,c,'T');
%%
img_CS = Contrast_stretching(X,Histogram);
img_CS_log = Contrast_streching_Log(X,Histogram);
img_CS_exp= Contrast_streching_Exp(X,Histogram,0.99);

%%
img_gamma = gamma_correction(X,1,gamma,Histogram,'T');
img_HisEQ = Histogram_EQ(X,Histogram);

%%

fig2 = figure('color','w','outerposition',get(0,'screensize'));
subplot(2,3,1)
imshow(X,[0,255])
title('Original Image')
set(gca,'linewidth',1,'FontSize',15,'fontname','Times New Roman')
subplot(232)
imshow(img_THD,[0,255])
title('Thresholding')
set(gca,'linewidth',1,'FontSize',15,'fontname','Times New Roman')
subplot(233)
imshow(img_AdTHD,[0,255])
title(['Adaptive Thresholding(m=',num2str(m),'x',num2str(m),')'])
set(gca,'linewidth',1,'FontSize',15,'fontname','Times New Roman')
subplot(234)
imshow(img_CS,[0,255])
title('Contrast stretching')
set(gca,'linewidth',1,'FontSize',15,'fontname','Times New Roman')

subplot(235)
imshow(img_gamma,[0,255])
title(['Gamma correction(Gamma=',num2str(gamma,2),')'])
set(gca,'linewidth',1,'FontSize',15,'fontname','Times New Roman')

subplot(236)
imshow(img_HisEQ,[0,255])
title('Histogram Equalization')
set(gca,'linewidth',1,'FontSize',15,'fontname','Times New Roman')
%save fig
if ~exist('plot', 'dir')
    mkdir('plot')
end
fig2_savename=['./plot/' ,'All.tif'];
h=getframe(fig2);
imwrite(h.cdata,fig2_savename);
