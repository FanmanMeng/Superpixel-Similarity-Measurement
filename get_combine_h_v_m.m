function [B,BB,M,bb,n1,n2]=get_combine_h_v_m(B1,B2)
%% �ϲ��ᴮ������
ind1=find(B1>0);
v1=B1(ind1);
ind2=find(B2>0);
v2=B2(ind2);

n1=max(v1);
n2=max(v2);

ind=sub2ind([n1,n2],v1,v2);

%% ת������Ȼ��
% aa=zeros(1,max(ind));
[bb,bb1,bb2]=unique(ind);%���ڵ�Ψһ��
% cc=1:1:length(bb);%���ɶ�Ӧ������
M=zeros(n1,n2);
M(bb)=1;

B=zeros(size(B1));
B(ind1)=bb(bb2);

BB=zeros(size(B1));
BB(ind2)=bb2;