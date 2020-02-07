clear all; 
close all; 
clc;      

img = imread('crk.jpg');
figure(1);imshow(img);title('Original Image:');

img = rgb2gray(img);

F = fft2(img);

fc = fftshift(F);

S = log(1+abs(fc));
figure(2);imshow(S,[]);title('After Fourier and Log Transformation:');

D0=50;
M = size(img, 1);
N = size(img, 2);
u=0:(M-1);
v=0:(N-1);
x=find(u>M/2);
u(x)=u(x)-M;
y=find(v>N/2);
v(y)=v(y)-N;
[V,U]=meshgrid(v,u);
D=sqrt(U.^2+V.^2);
H=double(D<=D0);
G = F.*H;
g = ifftshift(G);
f = ifft2(g);
figure(3);imshow(f,[]),title('Result of low pass filtering:');