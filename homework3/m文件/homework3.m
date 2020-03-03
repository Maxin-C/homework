% 声明一个10000*10000的矩形空间
L=1000;
S=ones(L);
S(:,:)=255;
S(1,:)=0;
S(L,:)=0;
S(:,1)=0;
S(:,L)=0;

Amp=L^2/4;% 放大倍数

m=7;% 圆的数量
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