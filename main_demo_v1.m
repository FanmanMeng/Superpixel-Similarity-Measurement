%% This is the code for paper:  Please cite the paper (bib is listed below) if you use the code.
% F. Meng, H. Li, Q. Wu, B. Luo, C. Huang and K. Ngan, Globally Measuring
% the Similarity of Superpixels by Binary Edge Maps for Superpixel
% Clustering, IEEE Transactions on Circuits and Systems for Video
% Technology, In press, 2016.

% @ARTICLE{fmmeng_csvt2016, 
% author={F. Meng and H. Li and Q. Wu and B. Luo and C. Huang and K. Ngan}, 
% journal={IEEE Transactions on Circuits and Systems for Video Technology}, 
% title={Globally Measuring the Similarity of Superpixels by Binary Edge Maps for Superpixel Clustering}, 
% year={2016}, 
% volume={PP}, 
% number={99}, 
% pages={1-1}, 
% keywords={Distribution functions;Electronic mail;Graphical models;Image color analysis;Image edge detection;Image segmentation;Semantics;Clustering;Edge Analysis;Global Similarity Measurement}, 
% doi={10.1109/TCSVT.2016.2632148}, 
% ISSN={1051-8215}, 
% month={},}

%% demon for
%    [E,L,M1, M2]=get_similarity_matrix_v1(img_path,img_name);
%% Input
% img: an image.
%% Output
% E: the binary edge map.
% L: the superpixel matrix.
% M1: the similarity matrix by edges. Neighboring superpixels are considered.
% M2: the similarity matrix by colors. Neighboring superpixels are considered.

addpath(genpath('.\release\'));
addpath(genpath('.\pDollarToolbox\'));

clear all;
close all;
warning off;

% read image
img_path='.\';
img_name='2018.jpg';

[E,L,M1, M2]=get_similarity_matrix_v1(img_path,img_name);
subplot(2,2,1);
imshow(E,[]);
title('Edge Map');
subplot(2,2,2);
imshow(L,[]);
title('Superpixels');
subplot(2,2,3);
imshow(M1,[]);
title('Superpixel Similarity Matrix by Edge');
subplot(2,2,4);
imshow(M2,[]);
title('Superpixel Similarity Matrix by Color');
colormap(jet);