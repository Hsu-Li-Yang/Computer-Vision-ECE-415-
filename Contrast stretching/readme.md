# Image processing 
Here is the demo for some basic image processing method.   
There would be 2 different kinds of binazation,contrast stretching, gamma correction and histogram equalization.   

## Global Threshloding
In global threshloding, we need to select an threshold by histogram. In this demo, I select Intensity = 39 to be the threshold because there is a valley when I = 39.    
The intensities less than 39 would be changed into 0, and the intensities larger than 39 would be changed into 255.    
After thresholding, the image only has 0 and 255 two kind of intensities. This not only compresses the image size but also show the object feature in this image.
![img_1.png](https://github.com/Hsu-Li-Yang/Computer-Vision-ECE-415-/blob/main/Contrast%20stretching/img/img_1.png)
## Adaptive Threshloding
However, the global threshold can't extract the detail feature in this image.    
Therefore, I also implement the adaptive thresholding algorithm. The adaptive thresholding algorithm that the threshold would be dynamically change based on the formula(1).
![f1.png](https://github.com/Hsu-Li-Yang/Computer-Vision-ECE-415-/blob/main/Contrast%20stretching/img/f1.png)
Block: 7x7 matrix. c is constant that c = 1. In adaptive thresholding algorithm, it can extract the detail feature in image.
![img_2.png](https://github.com/Hsu-Li-Yang/Computer-Vision-ECE-415-/blob/main/Contrast%20stretching/img/img_2.png)

## contrast stretching
Contrast streching is an common method when the detail of the image is hidden, and you can set the range of the intensities being stretched.   
For example, if I want stretching the image that included 90% of pixel intensities.(i.e except the lowest 5% and highest 5%)
In our example, the range of our histogram of image, it would be I=6 amd I=95.   
Then, we can apply contrast stretching in our image based on formula(2)
![f2.png](https://github.com/Hsu-Li-Yang/Computer-Vision-ECE-415-/blob/main/Contrast%20stretching/img/f2.png)
d = max pixel value in image, and c = min pixel value in image.   
In the condition of except 5% lowest value and except 5% highest value, c would be 6 and d would be 95.    
=>a = 0, b = 255, c = 6 and d = 95

