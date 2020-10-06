function new_img =Adaptive_Thresholding(img,Histogram,m,c,plot_or_not)
   
    bit = 8;
    Max_I = 2^bit;
    [H,W]  = size(img);
    new_img = img;    
    [~,L] = size(Histogram);
    local_block = zeros(m,m);
    for i = 1:m:H
        for j = 1:m:W
            
            
            index_i = min(i+m-1,H);
            index_j = min(j+m-1,W);
            local_block(1:index_i-i+1,1:index_j-j+1) = img(i:index_i,j:index_j);
            local_threshold = round(mean(mean(img(i:index_i,j:index_j))))-c; %find min
            local_block(local_block>=local_threshold) = 255; %thresholding
            local_block(local_block<local_threshold) = 0; %thresholding
            
            new_img(i:index_i,j:index_j) =local_block(1:index_i-i+1,1:index_j-j+1);
            
        end
    end
   new_Histogram = find_Histogram(new_img); 
   if plot_or_not == 'T'
       fig = figure('color','w','outerposition',get(0,'screensize'));
       subplot(221)
       imshow(img)
       title('Original image')
       set(gca,'linewidth',1,'FontSize',15,'fontname','Times New Roman')
       subplot(222)
       imshow(new_img)
       title(['Adaptive Thresholding(block size=',num2str(m),'x',num2str(m),')'])
       set(gca,'linewidth',1,'FontSize',15,'fontname','Times New Roman')
       subplot(223)
       title('Histogram')
       hold on 
       plot(0:L-1,Histogram/(W*H),'-k','linewidth',1.5);
       grid on 
       xlabel('Intensity')
       ylabel('Probability')
       set(gca,'linewidth',1,'FontSize',15,'fontname','Times New Roman')
       axis([0,255,-Inf,1.2*max(Histogram/(W*H))])
    %    legend([p1 p2],'Histogram','Histogram(smoothing)')
       

       subplot(224)
       bar(0:L-1,new_Histogram/(W*H),'k','linewidth',1.5)
       axis([-5,260,-Inf,1.2*max(new_Histogram/(W*H))])
       title('Histogram of Adaptive Thresholding image')
       set(gca,'linewidth',1,'FontSize',15,'fontname','Times New Roman')
       xlabel('Intensity')
       ylabel('Probability')
       grid on
       %save fig
       if ~exist('plot', 'dir')
            mkdir('plot')
       end
       fig_savename=['./plot/' ,'Adaptive_Threshloding.tif'];
       h=getframe(fig);
       imwrite(h.cdata,fig_savename);
   end
end

