function new_img = gamma_correction(img,a,gamma,Histogram,plot_or_not)
    
   [H,W]  = size(img);
   new_img = im2double(img);
   new_img = round(a * new_img.^(gamma).*255);
   new_Histogram = find_Histogram(new_img);
   
   if plot_or_not == 'T'
       fig = figure('color','w','outerposition',get(0,'screensize'));
       subplot(221)
       imshow(img)
       title('Original image')
       set(gca,'linewidth',1,'FontSize',15,'fontname','Times New Roman')
       subplot(222)
       imshow(new_img,[0,255])
       title(['Gamma correction(',num2str(gamma,2),')'])
       set(gca,'linewidth',1,'FontSize',15,'fontname','Times New Roman')
       
       subplot(223)   
       plot(0:255,Histogram/(W*H),'-k','linewidth',1.5)
       title('Histogram of original image')
       set(gca,'linewidth',1,'FontSize',15,'fontname','Times New Roman')
       xlabel('Intensity')
       ylabel('Probability')
       grid on
       axis([-5,260,-Inf,1.2*max(Histogram/(W*H))]) 
       subplot(224)
       plot(0:255,new_Histogram/(W*H),'-k','linewidth',1.5)
       axis([-5,260,-Inf,1.2*max(new_Histogram/(W*H))])
       title('Histogram of Histogram equalization image')
       set(gca,'linewidth',1,'FontSize',15,'fontname','Times New Roman')
       xlabel('Intensity')
       ylabel('Probability')
       grid on
       %save fig
       if ~exist('plot', 'dir')
            mkdir('plot')
       end
       fig_savename=['./plot/' ,'Gamma_correction.tif'];
       h=getframe(fig);
       imwrite(h.cdata,fig_savename);
   end
end