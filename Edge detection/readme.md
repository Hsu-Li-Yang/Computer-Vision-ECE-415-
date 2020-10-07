# Morphological Erosion and Dilation & Edge detection

## Morphological Erosion and Dilation
Morpgological Erosion and Dilation are common in computer vision, it could change the shape of the object.
To implement it, you can use any linear filter such as the simple one- box filter.
### Then we assume that g(x,y) = F * s(x,y), F is an kxk box filter
For Erosion we want out object become thinner, so we set
### g(x,y) = 1 if  g(x,y) >= S   
### g(x,y) = 0 otherwise 
### ( S value is depend on your filter, i.e all of the element in your silding window is 1, the center of the pixel could remain 1 otherwise it would become 0)
## Morphological Dilation
