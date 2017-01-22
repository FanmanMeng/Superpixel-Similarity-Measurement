function M11=get_clustering_meng_color(B,img)

N1=sparse(get_neighbour(B));% 获取横向邻近关系
N2=sparse(get_neighbour(rot90(B,1)));% 获取纵向邻近关系

M11=zeros(size(N1));

I1=img(:,:,1);
I2=img(:,:,2);
I3=img(:,:,3);

STATS3 = regionprops(B,'PixelIdxList'); 
S4=[];
for i=1:length(STATS3)
    ind=STATS3(i).PixelIdxList;
    S4(i).color=[mean(I1(ind)),mean(I2(ind)),mean(I3(ind))];
end


ind=find(N1==1);
[x,y]=ind2sub(size(N1),ind); %第x区域和第y个区域
%获取区域的像素值
for i=1:length(x)
%     if mod(i,100)==1
%         disp([num2str(i),'//',num2str(length(x))]);
%     end
    ind_temp1=S4(x(i)).color;
    ind_temp2=S4(y(i)).color;
%     C=((ind_temp1-ind_temp2)*(ind_temp1-ind_temp2)')^0.5;
    C=sum(abs(ind_temp1-ind_temp2));
    M11(x(i),y(i))=C(:);
    M11(y(i),x(i))=C(:);
end


ind=find(N2==1);
[x,y]=ind2sub(size(N2),ind); %第x区域和第y个区域
%获取区域的像素值
for i=1:length(x)
%     if mod(i,100)==1
%         disp([num2str(i),'//',num2str(length(x))]);
%     end
    ind_temp1=S4(x(i)).color;
    ind_temp2=S4(y(i)).color;
    C=sum(abs(ind_temp1-ind_temp2));
    M11(x(i),y(i))=C(:);
    M11(y(i),x(i))=C(:);
end


ind=find(M11>0);
v=M11(ind);
v1=exp(-v./60);
M11(ind)=v1;

% % M12=sparse(zeros(size(M11)));
% % for i=1:size(M11,1)
% %     a=M11(i,:);
% %     [v,ind]=sort(a,'descend');
% %     bb=length(find(v>0));
% %     M12(i,ind(1:min(bb,T)))=1;
% % end

% M11=1-M11/max(M11(:));
% B13=get_cluster_new(M11,B,T);