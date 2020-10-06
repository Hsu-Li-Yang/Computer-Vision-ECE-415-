function new_img =Thresholding(img,Histogram)
   

    [H,W]  = size(img);
    new_img = img;    
    [~,L] = size(Histogram);
%     n = 1;
%     half_n = floor(n);
%     Histogram_smooth = zeros(1,L);
%     for i= 1:L
%         start  = max(1,i-n);
%         last = min(L,i+n);
%         Histogram_smooth(i) = mean(Histogram(start:last));
%     end
%     Invert_H = max(Histogram_smooth)-Histogram_smooth;
%     [~,pos] = findpeaks(Invert_H);
    threshold = 39;
    for i = 1:H
        for j = 1:W
            if img(i,j)>37
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
   p1=plot(0:L-1,Histogram/(W*H),'-k','linewidth',1.5);
%    p2=plot(1:L,Histogram_smooth/(W*H),'--r','linewidth',1.5);
   p3=plot(threshold,Histogram(threshold)/(W*H),'r-O','linewidth',1.5);
   text(threshold+3,Histogram(threshold)/(W*H),['\leftarrow','Threshold=',num2str(threshold)],'fontsize',12)
   grid on 
   xlabel('Intensity')
   ylabel('Probability')
   set(gca,'linewidth',1,'FontSize',15,'fontname','Times New Roman')
   axis([0,255,-Inf,1.2*max(Histogram/(W*H))]) 
%    legend([p1 p2],'Histogram','Histogram(smoothing)')

   subplot(224)
   bar([0:255],new_Histogram/(W*H),'k','linewidth',1.5)
   axis([-5,260,-Inf,1.2*max(new_Histogram/(W*H))])
   title('Histogram of Thresholding image')
   set(gca,'linewidth',1,'FontSize',15,'fontname','Times New Roman')
   xlabel('Intensity')
   ylabel('Probability')
   grid on
   %save fig
   if ~exist('plot', 'dir')
       mkdir('plot')
   end
   fig_savename=['./plot/' ,'Thresholding.tif'];
   h=getframe(fig);
   imwrite(h.cdata,fig_savename);
end

