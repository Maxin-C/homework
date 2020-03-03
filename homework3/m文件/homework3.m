% ����һ��10000*10000�ľ��οռ�
L=1000;
S=ones(L);
S(:,:)=255;
S(1,:)=0;
S(L,:)=0;
S(:,1)=0;
S(:,L)=0;

Amp=L^2/4;% �Ŵ���

m=7;% Բ������
count=0;
for i=1:m
    E=Edge(S,L);
    [m,n]=find(E);
    [x,y,r]=Circle(S,E);
    for j=min(m):max(m)
        for k=min(n):max(n)
            if sqrt((j-x)^2+(k-y)^2)<=r
                S(j,k)=0;
            end
        end
    end

    count=count+r^2;
end
count=count/Amp
image(S);