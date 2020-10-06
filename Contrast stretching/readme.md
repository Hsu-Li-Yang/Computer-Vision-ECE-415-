# Thresholding and contrast streching
Here is the demo of binarization by different thresholding method, global thresholding and adaptive thresholding.
Then, there would have 3 different method of contrast streching.

## Global Threshloding
We need to select an threshold by histogram. In this demo, I select Intensity = 39 to be the threshold because there is a valley when I = 39.    
The intensities less than 39 would be changed into 0, and the intensities larger than 39 would be changed into 255.    
After thresholding, the image only has 0 and 255 two kind of intensities. This not only compresses the image size but also show the object feature in this image.
![img_1.png](https://github.com/Hsu-Li-Yang/Computer-Vision-ECE-415-/blob/main/Contrast%20stretching/img/img_1.png)
## Adaptive Threshloding
However, the global threshold can extract the detail feature in this image.    
Therefore, I also implement the adaptive thresholding algorithm. The adaptive thresholding algorithm that the threshold would be dynamically change based on the formula(1).
![f1.png](https://github.com/Hsu-Li-Yang/Computer-Vision-ECE-415-/blob/main/Contrast%20stretching/img/f1.png)
Block: 7x7 matrix. c is constant that c = 1. In adaptive thresholding algorithm, it can extract the detail feature in image.
![img_2.png](![img_1.png](https://github.com/Hsu-Li-Yang/Computer-Vision-ECE-415-/blob/main/Contrast%20stretching/img/img_1.png))
