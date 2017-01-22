function M1=get_similarity_matrix_v2(Eedg_map,L)
%% Input
% Eedg_map: binary edge map
% L: the superpixels
%% Output
% M1: the similarity matrix by edges. Neighboring superpixels are considered.

%% calculate the similarity matrix for the superpixels by edge
[DR1,DR2,~,~,~]=get_superpixel_initial_mv1(Eedg_map);
M1=get_clustering_meng1(L,DR1,DR2); % get the similarity matrix by edge (our method)
