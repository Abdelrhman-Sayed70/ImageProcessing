I = imread('55.jpg');
figure,imshow(I),title('Original Image');
x = im2double(I);

% transform the image to frequency domain
F = fft2(x);
FS = fftshift(F);

figure,imshow(log(abs(FS)),[]),title('Frequency Domain');

% mask for ("aerialpompeiiperiodic.jpg”)
H = ones(size(FS));
H(275:277, 619:621) = 0;
H(474:476, 619:621) = 0;

H(276:278, 621:623) = 0;
H(476:479, 621:623) = 0;

H(375:377, 518:520) = 0;
H(375:377, 719:721) = 0;

H(377:379, 521:523) = 0;
H(377:379, 722:724) = 0;
figure, imshow(H),title('Filter');

% multiply the frequency image by the mask
G = FS .* H;

figure,imshow(log(abs(G)),[]),title('Power Spectrum');

IFS = ifftshift(G);
IF = ifft2(IFS);
figure, imshow(IF), title('Restored'); 


