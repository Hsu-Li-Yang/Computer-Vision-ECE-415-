function [output,T] = similarity(intput,theta,s,t)
    T = [s*cos(theta),-s*sin(theta),t;s*sin(theta),s*cos(theta),t;0,0,1];
    output = T*intput;
end