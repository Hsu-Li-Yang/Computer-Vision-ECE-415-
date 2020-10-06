function [output,T] = projective(intput,a00,a01,a02,a10,a11,a12,a20,a21)
    T = [a00,a01,a02;a10,a11,a12;a20,a21,1];
    output = T*intput;
end