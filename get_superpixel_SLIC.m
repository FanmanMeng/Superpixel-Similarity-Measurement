function Es3=get_superpixel_SLIC(img,T)


        [E1,E,super]=get_edges(uint8(img),[]);%
        ind=find(E1>T); % other threshold can also be used.
        E2=zeros(size(E));
        E2(ind)=1;%;E1(ind);
        Es3=E2;
% % %         Es3(1,:)=1;
% % %         Es3(end,:)=1;
% % %         Es3(:,1)=1;
% % %         Es3(:,end)=1;      