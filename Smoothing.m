clear; clc;
i=imread('cameraman.tif');
y=i;
im = padarray(y,[1,1],0);
[row,col] = size(im);
images = im;


w = [1 1 1;1 1 1;1 1 1];



for r=2:row-1
    for c=2:col-1
        images(r,c) = sum(sum(w.*double(im(r-1:r+1,c-1:c+1))))/9;
        
    end
end

image = uint8(images);
subplot(1,2,1); imshow(y),title('Original Image');
subplot(1,2,2); imshow(image),title('Blurred Image');

