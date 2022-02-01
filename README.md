# Variational_Methods_for_Image_Processing

In this project, we implement the variational method to do the image denoising and contrast enhancement. Since the minimum problems are NP-hard, we use the Split Bregman method to approximate the solution. It's efficient and has a convergence guarantee.

## Experiments
### ROF Model (Physica D, 1992)
<img src="https://render.githubusercontent.com/render/math?math=$\displaystyle \min_{u \in BV(\Omega)} \left(\|u\|_{TV(\Omega)} %2B \frac{\lambda}{2} \int_\Omega (u-f)^2 dx \right)$">


![Image](https://github.com/Jia-Wei-Liao/Variational_Methods_for_Image_Processing/blob/main/result/denoising.jpg)


### Hsieh-Shao-Yang Model (SIIMS 2020)
<img src="https://render.githubusercontent.com/render/math?math=$\displaystyle \min_{u} \left(\frac{1}{2} \int_{\Omega} |\nabla u - \nabla f|^2 dx %2B \frac{\lambda}{2} \int_\Omega (u-\bar{u})^2 dx \right)$">


![Image](https://github.com/Jia-Wei-Liao/Variational_Methods_for_Image_Processing/blob/main/result/enhancement.jpg)\


Citation
If you find our work useful in your project, please cite:
```
@misc{
    title  = {variational_methods_for_image_processing},
    author = {Jia-Wei Liao},
    url    = {https://github.com/Jia-Wei-Liao/Variational_Methods_for_Image_Processing},
    year   = {2022}
}
```
