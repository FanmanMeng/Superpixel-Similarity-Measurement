function M1=get_sim_meng(M)

M=sparse(M);
a=full(sum(M'));
MM1=repmat(a,length(a),1);
MM2=MM1';
MM3=max(MM1,MM2);
% % % xa=ones(size(M));
% % % ind=find(M==1);
% % % [x,y]=ind2sub(size(M),ind);
% % % vv=a(x);
% % % xa(ind)=vv;
% % % MM=M./xa;
M1=M*M';
M1=M1./MM3;