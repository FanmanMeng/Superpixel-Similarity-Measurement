function [E,U,super]=get_edges(I,path1)
% cd('G:\my_code\part_segmentation\semantic segmentation\object-proposals-master\object-proposals-master\dependencies\structuredEdges\release\');
% Generate Edge Boxes object proposals in single image.
%-------
% load aa;
% ebconfig=aa;
model = load('./release/models/forest/modelBsds.mat');
model = model.model;
model.opts.multiscale = 0;
model.opts.sharpen = 2;
model.opts.nThread = 4;

%%
opts = spDetect;
opts.nThreads = 4;  % number of computation threads
opts.k = 512;       % controls scale of superpixels (big k -> big sp)
opts.alpha = .5;    % relative importance of regularity versus data terms
opts.beta = .9;     % relative importance of edge versus color terms
opts.merge = 0;     % set to small value to merge nearby superpixels at end
%%

[E,O,~,segs]=edgesDetect(I,model);
%%
[S,V] = spDetect(I,E,opts); 

%% compute ultrametric contour map from superpixels (see spAffinities.m)
[~,~,U]=spAffinities(S,E,segs,opts.nThreads);
% figure(3); im(1-U);

EE=E.*double(U>0.1);
E=EE;
bb=1-U;
cc=bb<0.95;
super=bwlabel(~cc);

%return;
% % % k=0.4;
% % % bdry=(U>=k);
% % % labels2 = bwlabel(U <= k);

% E=edgesNmsMex(E,O,2,0,1,model.opts.nThreads);

% cd(path1);