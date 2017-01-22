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
[DR1,DR2,~,~,~]=get_superpixel_initial_mv1(Eedg_map);
M1=get_clustering_meng1(L,DR1,DR2); % get the similarity matrix by edge (our method). 

%% by color ((by considering neighbor superpixels))
M2=get_clustering_meng_color(L,img);  % get the similarity matrix by color

%% combination
M1=sparse(M1);
M2=sparse(M2); 


alpha=0.9; % adjust parameters
M=alpha*M1+(1-alpha)*M2;

%% directed graph clustering for segmentation
T=0.4; % T \in [0,1]
Cluster_res=get_cluster_dgc(M,L,T); % M: the similarity matrix of superpixels. L: the superpixel matrix. t: threshold;
% Cluster_res is the clustering results
figure(1);
subplot(2,2,1);
imshow(Eedg_map,[]);
title('Edge Map');
subplot(2,2,2);
imshow(L,[]);
title('Superpixels');
subplot(2,2,3);
imshow(full(M1),[]);
title('Superpixel Similarity Matrix by Edge');
subplot(2,2,4);
imshow(full(M2),[]);
title('Superpixel Similarity Matrix by Color');
colormap(jet);

figure(2);
imshow(Cluster_res,[]);
title('The clustering results by our similarity and directed graph clustering');
colormap(jet);

