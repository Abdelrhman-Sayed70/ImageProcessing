I = imread('FigP0436(left)(hand_xray).tif');
figure,imshow(I),title('Original Image');
x = im2double(I);
%transform the image to frequency domain
F = fft2(x);
FS = fftshift(F);

figure,imshow(log(abs(FS)),[]),title('Frequency Domain');

% %mask for (“aerialpompeiiperiodic.jpg”)
% H = ones(size(FS));
% 
% figure, imshow(H),title('Filter');
% 
% %multiply the frequency image by the mask
% G = FS .* H;
% 
% figure,imshow(log(abs(G)),[]),title('Power Spectrum');
% 
% IFS = ifftshift(G);
% IF = ifft2(IFS);
% figure, imshow(IF), title('Restored'); 


