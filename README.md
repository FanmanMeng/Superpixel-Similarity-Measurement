# Superpixel-Similarity-Measurement
Globally Measuring the Similarity of Superpixels by Binary Edge Maps for Superpixel Clustering

%%--------------------------------------------------------
This is the code for paper [1], which can measure the similarities between superpixels by an edge map only.
-------------------------------------------------
Input: binary edge map (E) and superpixels (S)
Output: the similarity matrix (M) of the superpixels.
----------------------------------------------------


[1] F. Meng, H. Li, Q. Wu, B. Luo, C. Huang and K. Ngan, Globally Measuring the Similarity of Superpixels by Binary Edge Maps for Superpixel Clustering, IEEE Transactions on Circuits and Systems for Video Technology, In press, 2016.

Please cite the paper (bib is listed as follows) if you use the code.

@ARTICLE{fmmeng_csvt2016, 
author={F. Meng and H. Li and Q. Wu and B. Luo and C. Huang and K. Ngan}, 
journal={IEEE Transactions on Circuits and Systems for Video Technology}, 
title={Globally Measuring the Similarity of Superpixels by Binary Edge Maps for Superpixel Clustering}, 
year={2016}, 
volume={PP}, 
number={99}, 
pages={1-1}, 
doi={10.1109/TCSVT.2016.2632148}, 
ISSN={1051-8215}, 
month={},}


%%--------------------------------------------------------
The code is written by Matlab, and is tested on Win 7 64-bit system, and matlab R2015a only.

Please run "main_demo_v0.m", "main_demo_v1.m", or "main_demo_v2.m" for start

The details can be found in each .m file.

%%--------------------------------------------------------
Notice that three publically released toolboxes are used for generating the edges and superpixels in this code. Please cite the related papers if you use these codes.

1): pDollarToolbox from
https://github.com/pdollar/toolbox

2): Structured Edge Detection Toolbox V3.0 from
https://github.com/pdollar/edges

3): SLIC executable program for SLIC superpixel generation. 
The executable program should be replaced by the code from
http://www.vlfeat.org/overview/slic.html
for linux systems.

Please contact fmmeng@uestc.edu.cn if any errors are found.

