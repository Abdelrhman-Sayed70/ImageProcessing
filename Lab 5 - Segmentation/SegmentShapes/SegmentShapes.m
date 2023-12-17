% Do segmentation using edge detection
% Count number of objects and color each object with different color
I = imread('TestCase1.png');
figure, imshow(I), title('original image');

gr = rgb2gray(I);
figure, imshow(gr), title('gray image');

% edge detection
edgesI = edge(gr, "canny");
figure, imshow(edgesI), title('objects edges');

% dialation
se = strel('square', 15);
edgesI = imdilate(edgesI, se);
figure, imshow(edgesI), title('dialated image');

% negation: preprocessing for object segmentation (label)
edgesI = ~edgesI;
figure, imshow(edgesI), title('negated image');

% segmentation
[L, num] = bwlabel(edgesI);
figure, imshow(L), title('segmented objects');
rgbL = label2rgb(L);
figure, imshow(rgbL), title('segmented objects [rgb]');
fprintf("objects = %d\n", num);

% display each object with color equal to the original image color
% multiply with rgpL. image as it the original one is b/w
for i = 1 : num
    x = uint8(L == i);
    x = uint8(x);
   
    object = zeros(size(I));
    object(:, :, 1) = x .* rgbL(:, :, 1);
    object(:, :, 2) = x .* rgbL(:, :, 2);
    object(:, :, 3) = x .* rgbL(:, :, 3);
    figure, imshow(object);
end
