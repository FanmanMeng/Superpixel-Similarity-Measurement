function B=assign_label_mv1(A1,E)
%����ֵͼת���ɸ�����ı�ǩ

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
    n=max(B1(:));%A1��ȡ�Ŀ���
    ind=find(B2>0);
    B2(ind)=B2(ind)+n;
    Bt=B1+B2;
    B(:,i)=Bt+k-1;
    k=k+max(Bt(:));
end

B(ind11)=0;
    
%% ǰ����ȡ��ͨ
% % A=A1;
% % A(ind)=0;
% % [B1,N1]=bwlabel(double(A),4);%��A1���д���
% % 
% % %% ������ȡ��ͨ
% % A=~A1;
% % A(ind)=0;
% % [B2,N2]=bwlabel(double(A),4);
% % 
% % %% �ϲ�
% % n=max(B1(:));%A1��ȡ�Ŀ���
% % ind=find(B2>0);
% % B2(ind)=B2(ind)+n;
% % B=B1+B2;