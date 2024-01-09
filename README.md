# Variational Methods for Image Processing

In this project, we implement the variational method to do the image denoising and contrast enhancement. Since the minimum problems are NP-hard, we use the Split Bregman method to approximate the solution. It's efficient and has a convergence guarantee. This work is programmed on MATLAB, so if you want to reproduce our result, please install the MATLAB at the first.

## Methodology
Let $f$ be the original image and $u$ be the recover image. We do the image processing by solving the following variational problem.    
### ROF model (Physica D, 1992) 
$\displaystyle \min_{u \in BV(\Omega)}\left(\|u\|_{TV(\Omega)}+\frac{\lambda}{2}\int _{\Omega}(u-f)^2 dx\right)$

### Hsieh-Shao-Yang model (SIIMS 2020)
$\displaystyle \min_{u} \left(\frac{1}{2} \int _{\Omega} |\nabla u - \nabla h|^2 dx + \frac{\lambda}{2} \int _\Omega (u-g)^2 dx + \chi _{[0, 255]}(u) \right)$  

<!--
where  
$\displaystyle g(x)=\begin{cases}\alpha\bar{f}(x),\quad x\in\Omega_d\\ f(x), \quad x \in \Omega_b \end{cases},$
$\displaystyle h(x)=\begin{cases} \beta f(x), \quad x \in \Omega_d \\ f(x), \quad x \in \Omega_b \end{cases}, \text{and}$
$\displaystyle \chi_{[0, 255]}(u)=\begin{cases} 0, \quad \range(u) \subseteq [0, 255] \\ \infty, \quad \text{otherwise} \end{cases}$
-->

## Getting the code
You can download a copy of all the files in this repository by cloning this repository:
```
https://github.com/Jia-Wei-Liao/Variational_Methods_for_Image_Processing.git
```


## Experiments and results
**1. Image Denoising**  
The PSNR of the recover image is 29.702 (dB).  
![Image](https://github.com/Jia-Wei-Liao/Variational_Methods_for_Image_Processing/blob/main/result/denoising.jpg)  


**2. Image Contrast Enhancement**
![Image](https://github.com/Jia-Wei-Liao/Variational_Methods_for_Image_Processing/blob/main/result/enhancement.jpg)


## Reference
[1] T. Goldstein and S. Osher, The split Bregman method for L1-regularized problems, _SIAM Journal on Imaging Sciences,_ 2 (2009), pp. 323-343.  
[2] P.-W. Hsieh, P.-C. Shao, and S.-Y. Yang, Adaptive variational model for contrast enhancement of low-light images, _SIAM Journal on Imaging Sciences,_ 13 (2020), pp. 1-28.  
[3] L. I. Rudin, S. Osher, and E. Fatemi, Nonlinear total variation based noise removal algorithms, _Physica D,_ 60 (1992), pp. 259-268.  

## Citation
If you find our work useful in your project, please cite:
```
@misc{
    title  = {variational_methods_for_image_processing},
    author = {Jia-Wei Liao},
    url    = {https://github.com/Jia-Wei-Liao/Variational_Methods_for_Image_Processing},
    year   = {2022}
}
```
