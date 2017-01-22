function M11=get_clustering_meng1(B,Bv,Bh)

M1=get_represent(Bv,Bh);%竖区域之间的权值
M2=get_represent(Bh,Bv);%横区域之间的权值
% M2=max(M2,M2');
% toc
%将边缘区域设为0
% tic
n1=max(Bv(:));
n2=max(Bh(:));

N1=sparse(get_neighbour(B));% 获取横向邻近关系
N2=sparse(get_neighbour(rot90(B,1)));% 获取纵向邻近关系

% seg_show(B5);

%% 横向邻接关系
M11=zeros(size(N1));
M12=M11;
STATS3 = regionprops(B,'PixelIdxList'); 
S4=[];
for i=1:length(STATS3)
    ind=STATS3(i).PixelIdxList;
    ind_vertical=unique(Bv(ind));
    ind_herizion=unique(Bh(ind));
    S4(i).v=ind_vertical;
    S4(i).h=ind_herizion;
end

ind=find(N1==1);
[x,y]=ind2sub(size(N1),ind); %第x区域和第y个区域
%获取区域的像素值
for i=1:length(x)
%     if mod(i,100)==1
%         disp([num2str(i),'//',num2str(length(x))]);
%     end
    ind_temp1=S4(x(i)).v;
    ind_temp1=ind_temp1(find(ind_temp1>0));
    ind_temp2=S4(y(i)).v;
    ind_temp2=ind_temp2(find(ind_temp2>0));
    C=full(M1(ind_temp1,ind_temp2));
    M11(x(i),y(i))=mean(C(:));
    M11(y(i),x(i))=mean(C(:));
end
    
% x=b(x);
% y=b(y);
% [x1,x2]=ind2sub([n1,n2],x);
% [y1,y2]=ind2sub([n1,n2],y);
% ind1=sub2ind(size(M1),x1,y1);
% M11(ind)=M1(ind1);

%% 纵向邻接关系
% M21=zeros(size(N2));

% ind=find(N2==1);
% [x,y]=ind2sub(size(N2),ind);

ind=find(N2==1);
[x,y]=ind2sub(size(N2),ind); %第x区域和第y个区域
%获取区域的像素值
for i=1:length(x)
%     if mod(i,100)==1
%         disp([num2str(i),'//',num2str(length(x))]);
%     end
    ind_temp1=S4(x(i)).h;
    ind_temp1=ind_temp1(find(ind_temp1>0));
    ind_temp2=S4(y(i)).h;
    ind_temp2=ind_temp2(find(ind_temp2>0));
    C=full(M2(ind_temp1,ind_temp2));
    
% %     v1=unique(Bv(find(B==x(i))));
% %     v2=unique(Bv(find(B==y(i))));
% %     v3=unique([v1;v2]);
% %     ra=(length(v1)+length(v2)-length(v3))/length(v3);
    
    M11(x(i),y(i))=mean(C(:));
    M11(y(i),x(i))=mean(C(:));
end

% % x=b(x);
% % y=b(y);
% % [x1,x2]=ind2sub([n1,n2],x);
% % [y1,y2]=ind2sub([n1,n2],y);
% % ind1=sub2ind(size(M2),x2,y2);
% % % ind2=sub2ind(size(M2),y2,x2);
% % M11(ind)=M2(ind1);
% imshow_errow(B,M11);
% % B13=get_cluster_new(M11,B,T2);