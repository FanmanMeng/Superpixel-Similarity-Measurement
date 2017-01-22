%% This is the code for paper:
% F. Meng, H. Li, Q. Wu, B. Luo, C. Huang and K. Ngan, Globally Measuring
% the Similarity of Superpixels by Binary Edge Maps for Superpixel
% Clustering, IEEE Transactions on Circuits and Systems for Video
% Technology, In press, 2016.

%% Please cite the paper (bib is listed below) if you use the code.

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

%% Contract fmmeng@uestc.edu.cn for any error.


%% demon for
%   M1=get_similarity_matrix_v2(Eedg_map,L);
%% Input
% Eedg_map: binary edge map
% L: the superpixels
%% Output
% M1: the similarity matrix by edges. Neighboring superpixels are considered.



addpath(genpath('.\release\'));
addpath(genpath('.\pDollarToolbox\'));
clear all;
close all;
warning off;

% read image
img_path='.\';
img_name='2018.jpg';
img=double(imread([img_path,img_name]));
M_size=256;
N_size=256;

 img=imresize(img,[M_size,N_size],'nearest');

 %% obtain the binary edge map by Edgebox
 T=0.2;
Eedg_map=get_superpixel_SLIC(img,T); % T \in [0,1];


%% obtain the superpixels by SLIC. 15 and 500 are parameters.
L=initilization(img_path,img_name,15,500,M_size,N_size);

%% calculate the similarity matrix (by considering neighbor superpixels) for the superpixels by edge
M1=get_similarity_matrix_v2(Eedg_map,L);
imshow(M1,[]);
title('Superpixel Similarity Matrix by Edge');
colormap(jet);




