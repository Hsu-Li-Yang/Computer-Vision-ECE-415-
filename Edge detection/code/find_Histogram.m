function Histogram = find_Histogram(img)
    
    bit =8;
    [H,W]  = size(img);
    Histogram = zeros( 1,2^bit);

    for i = 1:H
        for j = 1:W
            Histogram(img(i,j)+1) = Histogram(img(i,j)+1)+1;
        end
    end
    
    Histogram = Histogram /(W*H);
end
