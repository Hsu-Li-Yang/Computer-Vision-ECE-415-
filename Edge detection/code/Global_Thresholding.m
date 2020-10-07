function new_img =Global_Thresholding(img,Histogram,threshold,dir)
   

    [H,W]  = size(img);
    new_img = img;    
    [~,L] = size(Histogram);


    for i = 1:H
        for j = 1:W
            if img(i,j)>threshold
                new_img(i,j) = 255; 
            else
                new_img(i,j) = 0;
            end
        end
    end
   new_Histogram = find_Histogram(new_img); 
   
   fig=figure('color','w','outerposition',get(0,'screensize'));
   subplot(221)
   imshow(img)
   title('Original image')
   set(gca,'linewidth',1,'FontSize',15,'fontname','Times New Roman')
   subplot(222)
   imshow(new_img)
   title(['Thresholding(n=',num2str(threshold),')'])
   set(gca,'linewidth',1,'FontSize',15,'fontname','Times New Roman')
   subplot(223)
   title('Histogram')
   hold on 
   p1=bar(0:L-1,Histogram);
%    p2=plot(1:L,Histogram_smooth/(W*H),'--r','linewidth',1.5);
   p3=plot(threshold,Histogram(threshold),'r-O','linewidth',1.5);
   text(threshold+3,Histogram(threshold)+0.005,['\leftarrow','Threshold=',num2str(threshold)],'fontsize',12)
   grid on 
   xlabel('Intensity')
   ylabel('Probability')
   set(gca,'linewidth',1,'FontSize',15,'fontname','Times New Roman')
   axis([0,255,-Inf,1.2*max(Histogram)]) 
%    legend([p1 p2],'Histogram','Histogram(smoothing)')

   subplot(224)
   bar([0:255],new_Histogram)
   axis([-5,260,-Inf,1.2*max(new_Histogram)])
   title('Histogram of Thresholding image')
   set(gca,'linewidth',1,'FontSize',15,'fontname','Times New Roman')
   xlabel('Intensity')
   ylabel('Probability')
   grid on
   
   fig2 = figure('color','w');
   imshow(new_img,[0,255])
   title('Global threshold')
   set(gca,'linewidth',1,'FontSize',15,'fontname','Times New Roman')
   
   %save fig
   if ~exist(['plot/',dir], 'dir')
       mkdir(['plot/',dir])
   end
   fig_savename=['./plot/',dir ,'/Thresholding.tif'];
   h=getframe(fig);
   imwrite(h.cdata,fig_savename);
   
   fig_savename=['./plot/',dir ,'/Thresholding-2.tif'];
   h=getframe(fig2);
   imwrite(h.cdata,fig_savename);   
end


