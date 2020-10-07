function img_different2 = find_different(img1,img2,dir,name1,name2)

    if size(img1) ~= size(img2)
        disp('Img size are not same')
        return 
    end
    
    img1_double = im2int16(img1);
    img2_double = im2int16(img2);
    
    img_different = abs(  img1_double - img2_double ); 
    
    max_I = max(max(img_different));
    min_I = min(min(img_different));
    
    img_different2 = (img_different - min_I) / (max_I-min_I) *255 ;
    
    img_different2 = uint8(255 * mat2gray(img_different2));
    
    
    fig = figure('color','w','outerposition',get(0,'screensize'));
    subplot(221)
    imshow(img1)
    title(name1)
    set(gca,'linewidth',1,'FontSize',15,'fontname','Times New Roman')
    subplot(222)
    imshow(img2)
    title(name2)
    subplot(2,2,[3,4])
    imshow(img_different2)
    title(['Absolute different between',name1,'and',name2] )
    set(gca,'linewidth',1,'FontSize',15,'fontname','Times New Roman')
    
    fig2 = figure('color','w');
    imshow(img_different2)
    title(['Absolute different between',name1,'and',name2] )
    set(gca,'linewidth',1,'FontSize',15,'fontname','Times New Roman')
    
    %save fig
    if ~exist(['plot/',dir], 'dir')
       mkdir(['plot/',dir])
    end
    fig_savename=['./plot/',dir,'/' ,[name1,'vs',name2,'-1.tif']];
    h=getframe(fig);
    imwrite(h.cdata,fig_savename);
        
    fig2_savename=['./plot/',dir,'/' ,[name1,'vs',name2,'-2.tif']];
    h=getframe(fig2);
    imwrite(h.cdata,fig2_savename);

end