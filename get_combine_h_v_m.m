function [B,BB,M,bb,n1,n2]=get_combine_h_v_m(B1,B2)
%% 合并横串和竖串
ind1=find(B1>0);
v1=B1(ind1);
ind2=find(B2>0);
v2=B2(ind2);

n1=max(v1);
n2=max(v2);

ind=sub2ind([n1,n2],v1,v2);

%% 转换成自然数
% aa=zeros(1,max(ind));
[bb,bb1,bb2]=unique(ind);%存在的唯一树
% cc=1:1:length(bb);%生成对应的序列
M=zeros(n1,n2);
M(bb)=1;

B=zeros(size(B1));
B(ind1)=bb(bb2);

BB=zeros(size(B1));
BB(ind2)=bb2;