# Geometric Transformation
This is an demo for geometric transformation in computer vision   
It might help you to review the basic computer vision theory

## Homogeneous coordinate
When vectors only differ by scale, they are considered to be eqivalent.
We can convert homogeneous coordinate back into inhomogeeous coordinate by dividing through by the last element w   
![f1.png]( https://github.com/Hsu-Li-Yang/Computer-Vision-ECE-415-/blob/main/Geometric%20Transformation/img/f1.png)   
Homogeneous points whose last element w = 0 are called ideal point or points at infinity   
Homogeneous coordinate help us to easily to implement chain transformation by using matrix multiplitation
## Translation
![f2.png]( https://github.com/Hsu-Li-Yang/Computer-Vision-ECE-415-/blob/main/Geometric%20Transformation/img/f2.png)
## Euclidian (Rotation + Translation)
![f3.png]( https://github.com/Hsu-Li-Yang/Computer-Vision-ECE-415-/blob/main/Geometric%20Transformation/img/f3.png)
## Similarity
![f4.png]( https://github.com/Hsu-Li-Yang/Computer-Vision-ECE-415-/blob/main/Geometric%20Transformation/img/f4.png)
## Affine
![f5.png]( https://github.com/Hsu-Li-Yang/Computer-Vision-ECE-415-/blob/main/Geometric%20Transformation/img/f5.png)
## Projective
![f6.png]( https://github.com/Hsu-Li-Yang/Computer-Vision-ECE-415-/blob/main/Geometric%20Transformation/img/f6.png)
 
## Demo
![tri.png](https://github.com/Hsu-Li-Yang/Computer-Vision-ECE-415-/blob/main/Geometric%20Transformation/img/tri.png)

## Conculsion

![result.png](https://github.com/Hsu-Li-Yang/Computer-Vision-ECE-415-/blob/main/Geometric%20Transformation/img/result.jpg)   
This table conclude the degree of freedom and preserved properties for each transformation
## Reference 
[1]Szeliski, Richard. Computer vision: algorithms and applications. Springer Science & Business Media, 2010.
