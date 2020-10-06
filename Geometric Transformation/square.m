function output =  square(l,x0,y0)
   
   x=l*[0,0,1,1,0]+x0;
   y=l*[0,1,1,0,0]+y0;
   output = [x;y;ones(1,5)];
   
   
