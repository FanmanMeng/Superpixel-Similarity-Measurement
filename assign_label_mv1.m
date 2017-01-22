function B=assign_label_mv1(A1,E)
%将二值图转化成各区域的标签

ind11=find(E==1);
A1(ind11)=2;
k=1;
B=zeros(size(A1));
for i=1:size(A1,2)
    T=A1(:,i);
    indk=find(T>1);
    T(indk)=0;
    B1=bwlabel(T);
    T=~T;
    T(indk)=0;
    B2=bwlabel(T);
    n=max(B1(:));%A1获取的块数
    ind=find(B2>0);
    B2(ind)=B2(ind)+n;
    Bt=B1+B2;
    B(:,i)=Bt+k-1;
    k=k+max(Bt(:));
end

B(ind11)=0;
    
%% 前景求取联通
% % A=A1;
% % A(ind)=0;
% % [B1,N1]=bwlabel(double(A),4);%对A1进行处理
% % 
% % %% 背景求取联通
% % A=~A1;
% % A(ind)=0;
% % [B2,N2]=bwlabel(double(A),4);
% % 
% % %% 合并
% % n=max(B1(:));%A1获取的块数
% % ind=find(B2>0);
% % B2(ind)=B2(ind)+n;
% % B=B1+B2;