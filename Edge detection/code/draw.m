function draw(input_img,output_img,dir,method_name)

    Histogram =find_Histogram(input_img); 
    new_Histogram = find_Histogram(output_img);
    %%plot
        fig = figure('color','w','outerposition',get(0,'screensize'));
        subplot(221)
        imshow(input_img)
        title('Original image')
        set(gca,'linewidth',1,'FontSize',15,'fontname','Times New Roman')
        subplot(222)
        imshow(output_img,[0,255])
        title(method_name)
        set(gca,'linewidth',1,'FontSize',15,'fontname','Times New Roman')
        subplot(223)
        bar(0:255,Histogram)
        title('Histogram of original image')
        set(gca,'linewidth',1,'FontSize',15,'fontname','Times New Roman')
        xlabel('Intensity')
        ylabel('Probability')
        grid on
        axis([-5,260,-Inf,1.2*max(Histogram)]) 
        subplot(224)
        bar(0:255,new_Histogram)
        axis([-5,260,-Inf,1.2*max(new_Histogram)])
        title('Histogram of output image')
        set(gca,'linewidth',1,'FontSize',15,'fontname','Times New Roman')
        xlabel('Intensity')
        ylabel('Probability')
        grid on
        
        fig2 = figure('color','w');
        imshow(output_img,[0,255])
        title(method_name)
        set(gca,'linewidth',1,'FontSize',15,'fontname','Times New Roman')
        
        %save fig
        if ~exist(['plot/',dir], 'dir')
            mkdir(['plot/',dir])
        end
        fig_savename=['./plot/',dir,'/',[method_name,'.tif']];
        h=getframe(fig);
        imwrite(h.cdata,fig_savename);
        
        fig2_savename=['./plot/',dir,'/' ,[method_name,'2.tif']];
        h=getframe(fig2);
        imwrite(h.cdata,fig2_savename);
    
 
end