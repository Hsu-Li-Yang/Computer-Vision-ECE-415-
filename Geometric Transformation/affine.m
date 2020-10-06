function [output,T] = affine(intput,a00,a01,a02,a10,a11,a12)
    T = [a00,a01,a02;a10,a11,a12;0,0,1];
    output = T*intput;
end