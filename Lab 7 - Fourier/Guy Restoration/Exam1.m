I = imread('oIumJ.png');
figure, imshow(I), title('Original Image');
x = im2double(I);

% transform the image to frequency domain
F = fft2(x);
FS = fftshift(F);
figure,imshow(log(abs(FS)),[]),title('Frequency Domain');

% mask for ("oIumJ.jpg”)
H = ones(size(FS));
H(12:22, 115:125) = 0;
H(37:47, 115:125) = 0;
H(96:106, 115:125) = 0;
H(216:226, 115:125) = 0;
H(274:284, 115:125) = 0;
H(298:308, 115:125) = 0;

figure, imshow(H),title('Filter');

% multiply the frequency image by the mask
G = FS .* H;

figure,imshow(log(abs(G)),[]),title('Power Spectrum');

IFS = ifftshift(G);
IF = ifft2(IFS);
figure, imshow(IF), title('Restored'); 


