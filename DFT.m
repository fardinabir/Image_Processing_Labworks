clear all; %clear all previous history
close all; %close all window
clc;       %clear command window

img = imread('crk.jpg');
figure(1);imshow(img);title('Original Image:');

img = rgb2gray(img);

%Get fourier transform if of the image
F = fft2(img);
S = abs(F); %Magnitude

figure(2);imshow(S,[]);title('Fourier Transformed Image:');

%get centered spectrum {-1^x+y}
fc = fftshift(F);
figure(3);imshow(abs(fc),[]);title('Centered Spectrum Fourier:');

%apply log transformation
S2 = log(1+abs(fc));
figure(4);imshow(S2,[]);title('After Log Transformation:');

%Inverse Fourier
F = ifftshift(fc);
f = ifft2(F);
figure(5);imshow(f,[]),title('Inverse Fourier Transformed Image:');