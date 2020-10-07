function output_img_final =Morphology(input_img,type,k,object)
    
    
    [H,W]  = size(input_img);
    output_img = input_img;
    if object == 0
        output_img_tmp = zeros(H,W);
        output_img_tmp(input_img==0) = 255; 
    else
        output_img_tmp = input_img; 
    end
       
    %create filter
    if mod(k,2)==0
        k = k-1;
    end
    half_k=(k-1)/2;
    
    
    
    for i=1:H
        for j = 1:W
            min_i = max(i-half_k,1);min_j = max(j-half_k,1);
            max_i = min(i+half_k,H);max_j = min(j+half_k,W);
            S = sum(sum( output_img_tmp(min_i:max_i,min_j:max_j) ) );
            
            switch type
                case 'Dilation' 
                    if S >=1*255
                        output_img(i,j) = 1*255;
                    else
                        output_img(i,j) = 0;
                    end
                case 'Erosion'
                    if S >=  k*k*255
                        output_img(i,j) = 1*255;
                    else
                        output_img(i,j) = 0;
                    end
                otherwise 
                    disp('type does not exist')
            end
            
        end
    end
    
    if object == 0
        output_img_final = zeros(H,W);
        output_img_final(output_img==0) = 255; 
    else
        output_img_final = output_img; 
    end
            
end