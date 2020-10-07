clc;close all;clear all;
%%
%problem 1 
%part1
%load image
tic
disp('Proble 1...loading....');
dir = 'p1';
if ~exist(['./plot/',dir], 'dir')
    mkdir(['plot/',dir])
end

Text = imread('./Text.bmp');
%%
fig1 = figure('color','w');
imshow(Text,[0,255]);
title('Original image(Text)')
set(gca,'linewidth',1,'FontSize',15,'fontname','Times New Roman')
if ~exist(['plot/',dir], 'dir')
    mkdir(['plot/',dir])
end
fig_savename=['./plot/',dir,'/','original.tif'];
h=getframe(fig1);
imwrite(h.cdata,fig_savename);
%%
%part2
Histogram = find_Histogram(Text);
%Plot
fig2 = figure('color','w');
bar(0:255,Histogram)
axis([-5,260,-Inf,1.2*max(Histogram)])
title('Histogram of original image')
set(gca,'linewidth',1,'FontSize',15,'fontname','Times New Roman')
xlabel('Intensity')
ylabel('Probability')
grid on
fig_savename=['./plot/',dir,'/','Histogram.tif'];
h=getframe(fig2);
imwrite(h.cdata,fig_savename);
%%
%part3
threshold = 81;
Global_threshold_img =Global_Thresholding(Text,Histogram,threshold,dir);
%draw(Text,Global_threshold_img,dir,'Global Threshold');
%%
%part4
N=5;
Input = Global_threshold_img;
k=3;
for i =1:N
    
    Erosion_img_5 =Morphology(Input,'Erosion',k,0);
    Input = Erosion_img_5;
    
end
draw(Global_threshold_img,Erosion_img_5,dir,['Erosion 5 times(',num2str(k),'x',num2str(k),')']);

%%
%part5
Input = Erosion_img_5;
N=5;
k=3;
for i =1:N
    
    Dilation_img_5 =Morphology(Input,'Dilation',k,0);
    Input = Dilation_img_5;
    
end
draw(Global_threshold_img,Dilation_img_5,dir,['Dilation 5 times(',num2str(k),'x',num2str(k),')']);


%%
%part 7 
img_different1 = find_different(Global_threshold_img,Dilation_img_5,dir,'part(3)','part(5)') ;
%%
%part8
N=10;
Input = Global_threshold_img;
k=3;
for i =1:N
    
    Erosion_img_10 =Morphology(Input,'Erosion',k,0);
    Input = Erosion_img_10;
    
end
draw(Global_threshold_img,Erosion_img_10,dir,['Erosion 10 times(',num2str(k),'x',num2str(k),')']);
%%
%part9
Input = Erosion_img_10;
N=10;
k=3;
for i =1:N
    
    Dilation_img_10 =Morphology(Input,'Dilation',k,0);
    Input = Dilation_img_10;
    
end
draw(Global_threshold_img,Dilation_img_10,dir,['Dilation 10 times(',num2str(k),'x',num2str(k),')']);

%%
%part 11
img_different2 = find_different(Global_threshold_img,Dilation_img_10,dir,'part(3)','part(9)') ;
disp('Problem 1 Finished!!')
toc

%%
%Problem 2
%load image
tic 
disp('Proble 2...loading....');
dir2 = 'p2';
if ~exist(['./plot/',dir2], 'dir')
    mkdir(['plot/',dir2])
end

Bottle = imread('./bottle.bmp');
%%
%part1
fig3 = figure('color','w');
imshow(Bottle,[0,255]);
title('Original image(Bottle)')
set(gca,'linewidth',1,'FontSize',15,'fontname','Times New Roman')
if ~exist(['plot/',dir], 'dir')
    mkdir(['plot/',dir])
end
fig_savename=['./plot/',dir2,'/','original.tif'];
h=getframe(fig3);
imwrite(h.cdata,fig_savename);
%%

%part2
Histogram2 = find_Histogram(Bottle);
%Plot
fig4 = figure('color','w');
bar(0:255,Histogram2)
axis([-5,260,-Inf,1.2*max(Histogram)])
title('Histogram of original image')
set(gca,'linewidth',1,'FontSize',15,'fontname','Times New Roman')
xlabel('Intensity')
ylabel('Probability')
grid on
fig_savename=['./plot/',dir2,'/','Histogram.tif'];
h=getframe(fig4);
imwrite(h.cdata,fig_savename); 
%%
%part3
threshold2 = 77;
Global_threshold_bottle =Global_Thresholding(Bottle,Histogram2,threshold2,dir2);
%draw(Bottle,Global_threshold_bottle,dir,'Global Threshold');
%%
Input = Global_threshold_bottle;
N=5;
k=3;
for i =1:N
    
    Dilation_bottle_5 =Morphology(Input,'Dilation',k,0);
    Input = Dilation_bottle_5;
    
end
draw(Global_threshold_bottle,Dilation_bottle_5,dir2,['Dilation 5 times(',num2str(k),'x',num2str(k),')']);
%%
distance_transfrom = Distance_transform(Dilation_bottle_5,0,dir2);
disp('Problem 2 is Finished!')
toc