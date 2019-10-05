clc
clear all;
close all;
I = imread('window.JPG');
I3  = rgb2gray(I);
I1=im2double((imresize(I3,0.5)));
J = log(I1);
I2 = fftshift(J);
D0 = 50;
gh = 2;
gl = 1.5;
c = 1;
[m,n] = size(I2);
if mod(m,2) == 0
    p = floor(m/2);
else
    p = floor(m/2)+1;
end
if mod(n,2) == 0
    q = floor(n/2);
else
    q = floor(n/2)+1;
end
for u=1:m
    for v=1:n
        D(u,v) = sqrt((u-p)^2+(v-q)^2);
        H(u,v) = exp(c*(-D(u,v)^2/(2*D0^2)));
        H1(u,v) = ((gh-gl)*(I2(u,v)-H(u,v)))+gh;
    end
end
K = I2.*H1;
K1 = ifftshift(K);
K2 = exp(K1);
subplot(2,2,[1 3]),imshow(I1);
title('Original image');
subplot(2,2,[2 4]),imshow(K2);
title('Homomorphic filtered image');




