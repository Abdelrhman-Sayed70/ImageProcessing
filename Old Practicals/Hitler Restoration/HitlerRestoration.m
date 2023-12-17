I = imread('face2descreen.jpg');
figure,imshow(I),title('Original Image');
x = im2double(I);
%transform the image to frequency domain
F = fft2(x);
FS = fftshift(F);

figure,imshow(log(abs(FS)),[]),title('Frequency Domain');

%mask for (“face2descreen.jpg”)
H = ones(size(FS));
H(293:299, 393:399) = 0;
H(478:484, 393:399) = 0;

H(339:345, 303:310) = 0;
H(433:439, 303:310) = 0;

H(335:341, 483:489) = 0;
H(429:435, 483:489) = 0;

figure, imshow(H),title('Filter');

%multiply the frequency image by the mask
G = FS .* H;

figure,imshow(log(abs(G)),[]),title('Power Spectrum');

IFS = ifftshift(G);
IF = ifft2(IFS);
figure, imshow(IF), title('Restored'); 


