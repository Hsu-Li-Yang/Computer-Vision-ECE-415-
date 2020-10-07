function distance_transfrom = Distance_transform(input_img,object,dir)

%two pass alogrithmm
%forward
    [H,W]  = size(input_img);
    if object == 0
        tmp_img = zeros(H,W);
        tmp_img(input_img==0) = 255; 
    else
        tmp_img = input_img; 
    end        
    distance_transfrom = zeros(H,W);
    %%
    %Initialization
    for j = 1:W
        if tmp_img(1,j)==255
            distance_transfrom(1,j)= 1;
        end
    end
    for i = 1:H
        if tmp_img(i,1)==255
            distance_transfrom(i,1)= 1;
        end
    end
    %%
    for i = 2:H
        for j = 2:W
            if tmp_img(i,j) == 255
                d = min(distance_transfrom(i-1,j),distance_transfrom(i,j-1));
                distance_transfrom(i,j) = 1+d;
            end            
        end
    end
    
    %distance_transfrom = uint8(255 * mat2gray(distance_transfrom));
    
    
    
%backward
    for j = 1:W
        if tmp_img(H,j)==255
            distance_transfrom(H,j)= 1;
        end
    end
    for i = 1:H
        if tmp_img(i,W)==255
            distance_transfrom(W,1)= 1;
        end
    end
    for i = H-1:-1:1
        for j = W-1:-1:1
            if tmp_img(i,j) == 255
                d = min([distance_transfrom(i,j),1+distance_transfrom(i+1,j),1+distance_transfrom(i,j+1)]);
                distance_transfrom(i,j) = d ;
            else
                distance_transfrom(i,j) = 0 ;
            end     
            
        end
    end

    Max_d = max(max(distance_transfrom));
    Min_d = min(min(distance_transfrom));
    
    distance_transfrom_2 = (distance_transfrom-Min_d)/(Max_d-Min_d)*255;
    fig1 = figure('color','w');
    imshow(distance_transfrom_2,[0,255])
    title('Distance transform')
    set(gca,'linewidth',1,'FontSize',15,'fontname','Times New Roman')
    
    Area_matrix = distance_transfrom;
    Area_matrix(distance_transfrom~=0)=1;
    Area = sum(sum(Area_matrix));
 
    
    Edge = distance_transfrom;
    Edge(distance_transfrom~=1) = 255;
    Edge(distance_transfrom==1) = 0;



    count_matrix = zeros(H,W);
    count_matrix(distance_transfrom == Max_d) = 1;
    count_max_d = sum(sum(count_matrix ));
    count_perimeter = zeros(H,W);
    count_perimeter (Edge==0) = 1;
    perimeter = sum(sum(count_perimeter));
    x=1:W;
    y=1:H;
    [xx,yy] = meshgrid(x,y);
    xx(tmp_img == 0) = 0;
    yy(tmp_img == 0) = 0;
    centroid = [ round( sum(sum(xx)) / Area) , round( sum(sum(yy))/ Area)];

    
    
    disp(['Maximun distance =',num2str(Max_d)]);
    disp(['There are ',num2str(count_max_d),' pixel in value ',num2str(Max_d)]);
    disp(['Area=',num2str(Area)]);
    disp(['Perimeter=',num2str(perimeter)]);
    disp(['Centroid = (',num2str(centroid(1)),',',num2str(centroid(2)),')'])

    fig2=figure;
    imshow(Edge,[0,255]);
    hold on 
    plot(centroid(1),centroid(2),'*r')
    text(centroid(1),centroid(2)+5,['(',num2str(centroid(1)),',',num2str(centroid(2)),')'])
    title('Object Edge')
    set(gca,'linewidth',1,'FontSize',15,'fontname','Times New Roman')

       

    %save fig
    if ~exist(['plot/',dir], 'dir')
        mkdir(['plot/',dir])
    end
    fig_savename=['./plot/',dir,'/Distance_transform.tif'];
    h=getframe(fig1);
    imwrite(h.cdata,fig_savename);
    
    fig_savename=['./plot/',dir,'/Edge.tif'];
    h=getframe(fig2);
    imwrite(h.cdata,fig_savename);
    
    
    
    fileID = fopen(['./plot/',dir,'/result.txt'],'w');
    fprintf(fileID,['Maximun distance =',num2str(Max_d),'\n']);
    fprintf(fileID,['There are ',num2str(count_max_d),' pixel in value ',num2str(Max_d),'\n']);
    fprintf(fileID,['Area=',num2str(Area),'\n']);
    fprintf(fileID,['Perimeter=',num2str(perimeter),'\n']);
    fprintf(fileID,['Centroid = (',num2str(centroid(1)),',',num2str(centroid(2)),')','\n']);
    fclose(fileID);
    
end