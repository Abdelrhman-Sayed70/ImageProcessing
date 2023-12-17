% Do segmentation using edge detection
% Count number of objects and color each object with different color
I = imread('4.png');
figure, imshow(I), title('original img');

% convert to gray
gr = rgb2gray(I);
figure, imshow(gr), title('gray image');

% edge detection [white background]
edgesI = edge(gr, "canny");
figure, imshow(edgesI), title('objects edges');

% dialtion
se = strel('square', 5); % structure element
dilI = imdilate(edgesI, se);
figure, imshow(dilI), title('dilated img');

% preprocessing step before lable (edge detection) to make objects filled with white
dilI = ~dilI;
figure, imshow(dilI), title('negated dilated img');

% counting and colorize connected components
[L, objectsCount] = bwlabel(dilI);
Lrgb = label2rgb(L);
figure, imshow(Lrgb), title('final');
fprintf("objects count = %d\n", objectsCount);

% display each object with color equal to the original image color
% multiply with orig. image as it is a colored one
for i = 1 : objectsCount
    x = uint8(L == i);
    x = uint8(x);

    object = zeros(size(I));
    object(:, :, 1) = x .* I(:, :, 1);
    object(:, :, 2) = x .* I(:, :, 2);
    object(:, :, 3) = x .* I(:, :, 3);
    figure, imshow(uint8(object));
end

