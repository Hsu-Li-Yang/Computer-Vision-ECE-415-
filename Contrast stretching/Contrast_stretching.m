function new_img = Contrast_stretching(img,Histogram)
   

    [H,W]  = size(img);
    new_img = img;    
    cum_Histogram = cumsum(Histogram)/(W*H);
    c = find(cum_Histogram > 0.05, 1, 'first');
    d = find(cum_Histogram > 0.95, 1, 'first');
    a = 0;
    b = 255;
    
    for i = 1:H
        for j = 1:W
            new_img(i,j) = (img(i,j)-c)*((b-a)/(d-c))+a;
        end
    end
    
   new_Histogram = find_Histogram(new_img);
   fig = figure('color','w','outerposition',get(0,'screensize'));
   subplot(221)
   imshow(img)
   title('Original image')
   set(gca,'linewidth',1,'FontSize',15,'fontname','Times New Roman')
   subplot(222)
   imshow(new_img)
   title('Contrast stretching')
   set(gca,'linewidth',1,'FontSize',15,'fontname','Times New Roman')
   subplot(223)
   plot(0:255,Histogram/(W*H),'-k','linewidth',1.5)
   title('Histogram of original image')
   set(gca,'linewidth',1,'FontSize',15,'fontname','Times New Roman')
   axis([0,255,-Inf,1.2*max(Histogram/(W*H))]) 
   xlabel('Intensity')
   ylabel('Probability')
   grid on
   hold on 
   bar(c-1,Histogram(c)/(W*H),'FaceColor',[1 0 0],'EdgeColor',[1 0 0])
   bar(d-1,Histogram(d)/(W*H),'FaceColor',[1 0 0],'EdgeColor',[1 0 0])
   text(c-1,0.3*Histogram(c)/(W*H),['\leftarrow','c=',num2str(c-1),'(5%)'],'fontsize',12)
   text(d-1,Histogram(d)/(W*H),['\leftarrow','d=',num2str(d-1),'(95%)'],'fontsize',12)
   subplot(224)
   plot(0:255,new_Histogram/(W*H),'-k','linewidth',1.5)
   axis([-5,260,-Inf,1.2*max(new_Histogram/(W*H))])
   title('Histogram of Contrast stretching image')
   set(gca,'linewidth',1,'FontSize',15,'fontname','Times New Roman')
   xlabel('Intensity')
   ylabel('Probability')
   grid on
   
   %save fig
   if ~exist('plot', 'dir')
       mkdir('plot')
   end
   fig_savename=['./plot/' ,'Contrast_stretching.tif'];
   h=getframe(fig);
   imwrite(h.cdata,fig_savename);

end

