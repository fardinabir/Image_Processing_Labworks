clear; clc;
%i = imread('Lighthouse.jpg');
%x = imread(i);
%i=imread('Lighthouse.jpg');
i=imread('cameraman.tif');
%x = rgb2gray(i);
%y = rgb2gray(i);
y=i;
z = padarray(y,[1,1],0);
[row,col] = size(z);
images = z;

w = [0 1 0;1 -4 1;0 1 0];

for r=2:row-1
    for c=2:col-1
        images(r,c) = sum(sum(w.*double(z(r-1:r+1,c-1:c+1))));   
    end
end


image = uint8(images);
x=z-image;
subplot(1,3,1); imshow(y),title('Original Image');
subplot(1,3,2); imshow(image),title('Filtered Image');
subplot(1,3,3); imshow(x),title('Sharpened Image');