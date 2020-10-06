function output =hexagon(l,x0,y0)
   
   x=l*[-1 -0.5 0.5 1 0.5 -0.5 -1]+x0;
   y=l*sqrt(3)*[0 -0.5 -0.5 0 0.5 0.5 0]+y0;
   output = [x;y;ones(1,7)];
   
   
