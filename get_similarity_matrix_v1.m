function [Eedg_map,L,M1, M2]=get_similarity_matrix_v1(img_path,img_name)
%% input:
% img_path: the file folder of the input image, e.g. '.\img\'
% img_name: e.g. 'air.jpg'

%% output:
% E: the binary edge map.
% L: the superpixel matrix.
% M1: the similarity matrix by edges. Neighboring superpixels are considered.
% M2: the similarity matrix by colors. Neighboring superpixels are considered.

%% read image
img=double(imread([img_path,img_name]));
M_size=256;
N_size=256;

 img=imresize(img,[M_size,N_size],'nearest');
 
 %% obtain the binary edge map by Edgebox
Eedg_map=get_superpixel_SLIC(img,0.2);


%% obtain the superpixels by SLIC. 15 and 500 are parameters.
L=initilization(img_path,img_name,15,500,M_size,N_size);

%% calculate the similarity matrix for the superpixels by edge
[DR1,DR2,~,~,~]=get_superpixel_initial_mv1(Eedg_map);
M1=get_clustering_meng1(L,DR1,DR2); % get the similarity matrix by edge (our method)

%% by color
M2=get_clustering_meng_color(L,img);  % get the similarity matrix by color