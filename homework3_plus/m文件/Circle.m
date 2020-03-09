function [x,y,R]=Circle(S,E)
[m,n]=find(E);
x=(max(m)+min(m))/2;
y=(max(n)+min(n))/2;

x_range=x-(max(m)+min(m)):(max(m)+min(m))/200:x+(max(m)+min(m));
y_range=y-(max(n)+min(n)):(max(n)+min(n))/200:y+(max(n)+min(n));
r=ones(length(x_range),length(y_range));
r(:,:)=10000;

for j=1:length(x_range)
    for k=1:length(y_range)
        if x_range(j)>max(m) || y_range(k)>max(n) || x_range(j)<min(m) || y_range(k)<min(n)
            continue;
        end
        if S(floor(x_range(j)),floor(y_range(k)))==0
            continue;
        end
        for i=1:length(m)
            d=sqrt( (m(i)-x_range(j))^2 + (n(i)-y_range(k))^2 );
            if r(j,k) > d
                r(j,k) = d;
            end
        end
    end
end

for i=1:length(x_range)
    for j=1:length(y_range)
        if r(i,j)==10000
            r(i,j)=0;
        end
    end
end
[r_m,r_n]=find(r==max(max(r)));
if length(r_m)~=1
    r_m=r_m(1,floor(length(r_m)/2));
    r_n=r_n(1,floor(length(r_n)/2));
end
R=r(r_m,r_n);
x=x_range(1,r_m);
y=y_range(1,r_n);
end