close all;
clear all;
clc;

b=imread('pout.tif');
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
for i=2 :256
    cdf(i,1)=cdf(i-1,1)+pdf(i,1);
end


[r2,c2]=size(b);
ah2=uint8(zeros(r2,c2));
n2=r2*c2;
f2=zeros(256,1);
pdf2=zeros(256,1);
cdf2=zeros(256,1);

for i=1:r2
    for j=1:c2
        value2=b(i,j);
        f2(value2+1)=f2(value2+1)+1;
        pdf2(value2+1)=f2(value2+1)/n2;
    end
end


l=255;
cdf2(1,1)=pdf2(1,1);
for i=2 :256
    cdf2(i,1)=cdf2(i-1,1)+pdf2(i,1);
end
M = zeros(256,1,'uint8');  
for r=1:256
    [z,s] = min(abs(cdf(r)-cdf2));
    M(r) = s-1;     % s-1 here because s goes from 1 to 256 but M(r) ranges from 0 to 255
end

Img = a;
Ref = b;

out2 = M(double(Img)+1);



% Display all the images
figure(1);
subplot(231),imshow(Img),title('Original Image');
subplot(232),imshow(Ref),title('Reference Image');
subplot(233),imshow(out2),title('Final Image');
% display the histograms
subplot(234),imhist(Img),title('Histogram :Original Image');
subplot(235),imhist(Ref),title('Histogram :Reference Image');
subplot(236),imhist(out2),title('Histogram :Final Image');




