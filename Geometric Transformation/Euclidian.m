function [output,T] = Euclidian(intput,theta,t)
    T = [cos(theta),-sin(theta),t;sin(theta),cos(theta),t;0,0,1];
    output = T*intput;
end