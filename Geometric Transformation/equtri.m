function output =  equtri(l,x0,y0)
   
   x=l*[0,0.5,1,0]+x0;
   y=l*[0,sqrt(3)/2,0,0]+y0;
   output = [x;y;ones(1,4)];
   
   
