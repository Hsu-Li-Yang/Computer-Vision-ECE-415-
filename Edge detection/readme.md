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
Dilation is in the same ideal, but dilation we want our object become bigger. So the formula would turn into:
### g(x,y) = 1 if g(x,y) >= 1
### g(x,y) = 0 otherwise
 
 ## Application 
 There are some common application by erosion and dilation.
 ## Opening 
 The step of opening is just applied Erosion couple times, then applied Dilation couple times.
 ## Closing
 The step of opening is just applied Dilation couple times, then applied Erosion couple times.
 ## other operation
 - smooth the edge 
 - remove small object
 - fill in small holes
 
 ## Demo 
 Kenel size is 3x3 box filter.
 ## 1.Original Image
 ![img1.png](https://github.com/Hsu-Li-Yang/Computer-Vision-ECE-415-/blob/main/Edge%20detection/img/img1.png)
 ## 2.Binarization
 ![img2.png](https://github.com/Hsu-Li-Yang/Computer-Vision-ECE-415-/blob/main/Edge%20detection/img/img2.png)
 ## 3.After 5 times Erosion
 ![img3.png](https://github.com/Hsu-Li-Yang/Computer-Vision-ECE-415-/blob/main/Edge%20detection/img/img3.png)
 ## 4.After 5 times Dilation(from (2)) 
 ![img4.png](https://github.com/Hsu-Li-Yang/Computer-Vision-ECE-415-/blob/main/Edge%20detection/img/img4.png)
 ## 5.Different between original Image
 ![img5.png](https://github.com/Hsu-Li-Yang/Computer-Vision-ECE-415-/blob/main/Edge%20detection/img/img5.png)
 Image between (1) and (5) are similar, but not identical. Some of the feature is missing in 5 times erosion, so there are some distortion after 5 times dilation. For example, the word ‘a’ in image have some gap in the bottom.
 ## 6. After 10 times Erosion(from original Image)
 ![img6.png](https://github.com/Hsu-Li-Yang/Computer-Vision-ECE-415-/blob/main/Edge%20detection/img/img6.png)
 ## 7. After 10 times Dilation(from 6)
 ![img7.png](https://github.com/Hsu-Li-Yang/Computer-Vision-ECE-415-/blob/main/Edge%20detection/img/img7.png)
 ## 8. Different between Original Image
 ![img8.png](https://github.com/Hsu-Li-Yang/Computer-Vision-ECE-415-/blob/main/Edge%20detection/img/img8.png)
 After 10 times erosion, most of the information is lost. So we only can get some lines the points in the image in part(8). The image in part(8) and part(1) are totally different. 
