a=imread('cameraman.tif');
[r,c]=size(a);
ah=uint8(zeros(r,c));
n=r*c;
f=zeros(256,1);
pdf=zeros(256,1);
cdf=zeros(256,1);
out=zeros(256,1);

for i=1:r
    for j=1:c
        value=a(i,j);
        f(value+1)=f(value+1)+1;
        pdf(value+1)=f(value+1)/n;
    end
end

l=255;
cdf(1,1)=pdf(1,1);
out(1,1)=round(l*cdf(1,1));
for i=2 :256
    cdf(i,1)=cdf(i-1,1)+pdf(i,1);
    out(i,1)=round(l*cdf(i,1));
end

cdf
for i=1:r
    for j=1:c
        ah(i,j)=out(a(i,j)+1);
    end
end

figure,imshow(ah);
h=histeq(a);
figure,imshow(h);

