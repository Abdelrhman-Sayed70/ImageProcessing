I = imread('oIumJ.png');
figure, imshow(I), title('Original Image');
x = im2double(I);

% transform the image to frequency domain
F = fft2(x);
FS = fftshift(F);
figure,imshow(log(abs(FS)),[]),title('Frequency Domain');

% mask for ("oIumJ.jpg”)
H = ones(size(FS));
H(16.6:19.4, 119:123) = 0
H(42.3:43.7, 120:122) = 0;
H(101:103, 120:122) = 0;

H(219:221, 120:122) = 0;
H(278:280, 120:122) = 0;
H(303:306, 119:123) = 0;



% 
figure, imshow(H),title('Filter');

% multiply the frequency image by the mask
G = FS .* H;

figure,imshow(log(abs(G)),[]),title('Power Spectrum');

IFS = ifftshift(G);
IF = ifft2(IFS);
figure, imshow(IF), title('Restored'); 


