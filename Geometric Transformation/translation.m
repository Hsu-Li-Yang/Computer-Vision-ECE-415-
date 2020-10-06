function [output,T] = translation(intput,t)
    
    T = [1,0,t;0,1,t;0,0,1];
    output = T*intput;
end