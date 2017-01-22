function B10=get_cluster_dgc(M_relationship,B4,T)
%M_relationship:¹ØÏµ¾ØÕó
%B4:¸÷¿éÍ¼Ïñ
%T:ãĞÖµ

% tic
S1=double(M_relationship>T);
% S1=sparse(S1);
[s,c]=graphconncomp(S1);
% toc;

c=c';
B10=zeros(size(B4));
ind=find(B4>0);
I=B4(ind);
J=c(I);
B10(ind)=J;