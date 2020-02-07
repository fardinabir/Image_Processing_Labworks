clear all; %clear all previous history
close all; %close all window
clc;       %clear command window

img = imread('rose.jpg');
figure(1);imshow(img);title('Original Image:');

img = rgb2gray(img);

%Get fourier transform if of the image
F = fft2(img);

%get centered spectrum {-1^x+y}
fc = fftshift(F);

%apply log transformation
S = log(1+abs(fc));
figure(2);imshow(S,[]);title('After Fourier and Log Transformation:');

%create filter (low pass filter)
N = 10;
h = ones(N)/(N*N);
h(size(img,1),size(img,2)) = 0;
H = fft2(h);

%Apply Filtering
G = F.*H;

%Inverse Fourier
g = ifftshift(G);
f = ifft2(g);
figure(3);imshow(f,[]),title('Result of low pass filtering:');