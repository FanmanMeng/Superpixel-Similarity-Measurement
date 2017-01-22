function A11=get_lable_top(A)

A1=double(A);
A11=ones(size(A1));
        
for i=1:size(A1,2)
    A=A1(:,i);
    
    ind=find(A==1);
    if isempty(ind)
        continue;
    else
        A=~A;
% %         H=ones(1,length(A));
% %         k=2;
% %         for j=1:length(ind)-1
% %             H(ind(j):ind(j+1))=k;
% %             k=k+1;
% %         end
% % %         H=zeros(1,length(A));
% % % 
% %         H(ind(end):length(A))=k;
% % %         k=k+1;
% % %         for j=length(ind):-1:2
% % %             H(ind(j-1):ind(j)-1)=k;
% % %             k=k+1;   
% % %         end
% % %         H(1:ind(1))=k;
% % %         k=k+1;
% %         A11(:,i)=H';
H=bwlabel(A);
A11(:,i)=mod(H,2);
    end
end