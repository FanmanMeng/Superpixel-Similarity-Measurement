function M1=get_represent(B11,B2)
% using B2 to represent B11
[B4,B5,M]=get_combine_h_v_m(B11,B2);
M=sparse(M);
M1=get_sim_meng(M);

% % a=sum(M');
% % xa=ones(size(M));
% % ind=find(M==1);
% % [x,y]=ind2sub(size(M),ind);
% % vv=a(x);
% % xa(ind)=vv;
% % MM=M./xa;
% % M1=MM*M';