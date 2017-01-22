function M=get_neighbour(B1)
n=max(B1(:));
M=sparse(zeros(n,n));
% switch a
%     case 1 %%横着处理
        B_l=B1(:,1:end-1);
        B_r=B1(:,2:end);
        B=B_l-B_r;
        ind=find(B~=0);%边缘区域
        %找到他们的坐标（x,y）
        [x,y]=ind2sub(size(B),ind);
        ind_f=sub2ind(size(B1),x,y+1);
        b1=B1(ind);
        b2=B1(ind_f);
        c=b1.*b2;
        d=find(c~=0);
        b1=b1(d);
        b2=b2(d);
        ind=sub2ind([n,n],b1,b2);
        M(ind)=1;
        ind=sub2ind([n,n],b2,b1);
        M(ind)=1;
%     case 2 %% 纵向处理
%         B_l=B1(1:end-1,:);
%         B_r=B1(2:end,:);
%         B=B_l-B_r;
%         ind=find(B~=0);%边缘区域
%         %找到他们的坐标（x,y）
%         [x,y]=ind2sub(size(B),ind);
%         ind_f=sub2ind(size(B1),x+1,y);
%         b1=B1(ind);
%         b2=B1(ind_f);
%         c=b1.*b2;
%         d=find(c~=0);
%         b1=b1(d);
%         b2=b2(d);
%         ind=sub2ind([n,n],b1,b2);
%         M(ind)=1;
%         ind=sub2ind([n,n],b2,b1);
%         M(ind)=1;
end