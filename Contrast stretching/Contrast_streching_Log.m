function  new_img= Contrast_streching_Log(img,Histogram)
   

    [H,W]  = size(img);
    new_img = im2double(img) * 255;
    MAX_X = max(max(new_img));
    cum_Histogram = cumsum(Histogram)/(W*H);
    c = 255/(log10(1+MAX_X));
    
    for i = 1:H
        for j = 1:W
            new_img(i,j) = round(c * log10(1+new_img(i,j)));
        end
    end
    
   new_Histogram = find_Histogram(new_img);
   fig = figure('color','w','outerposition',get(0,'screensize'));
   subplot(221)
   imshow(img)
   title('Original image')
   set(gca,'linewidth',1,'FontSize',15,'fontname','Times New Roman')
   subplot(222)
   imshow(new_img,[0,255])
   title('Contrast streching log')
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
   title('Contrast streching log equalization image')
   set(gca,'linewidth',1,'FontSize',15,'fontname','Times New Roman')
   xlabel('Intensity')
   ylabel('Probability')
   grid on
   %save fig
   if ~exist('plot', 'dir')
       mkdir('plot')
   end
   fig_savename=['./plot/' ,'Contrast_streching_log.tif'];
   h=getframe(fig);
   imwrite(h.cdata,fig_savename);
end

