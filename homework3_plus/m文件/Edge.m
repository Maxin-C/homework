function im5=Edge(im3,LL)
% im4=bwlabel(im3,4);
% k=max(max(im4));
% for i=1:L
%     for j=1:L
%         if im4(i,j)<k
%             im4(i,j)=0;
%         else
%             im4(i,j)=255;
%         end
%     end
% end

im4=imfill(im3,'holes');
[L,num]=bwlabel(im4,4);
x=zeros(1,num);
for ii=1:num
   x(ii)=sum(sum(L==ii));
end
[~,ind]=max(x);
bw_img=(L==ind);

im5=double(edge(bw_img));

for i=1:LL
    for j=1:LL
        if im5(i,j)==1
            im5(i,j)=255;
        else
            im5(i,j)=0;
        end
    end
end
end