I = imread('shapes.png');
figure, imshow(I), title('original image');

% convert to gray
gr = rgb2gray(I);

% threshold
gr = im2bw(gr, graythresh(gr));
figure, imshow(gr), title('thresholded image');

% base form [black background]
base = ~gr;
figure, imshow(base), title('image in base form [black background]');

% erosion to split objects
se = strel("disk", 29);
eroddedI = imerode(base, se);
figure, imshow(eroddedI), title('erodded image');

% objects segmentation
[L, num] = bwlabel(eroddedI);
rgpL = label2rgb(L);
fprintf('Objects count = %d\n', num);
figure, imshow(rgpL), title('segmented objects');

% holders for different objects
Rectangle = zeros(size(L));
Circle = zeros(size(L));

% properties
stats = regionprops(L, "Perimeter", "Area", "Extent");
rectangularity = [stats.Extent];

% get rectangles --> rectangularity = 1
r = find(rectangularity == 1);
numberofrectangles = length(r);
fprintf("Rectangles count: %d\n", numberofrectangles);
for i = r
    Rectangle(L == i) = true;
    colormap = [1 0 0];
    rect_img = label2rgb(Rectangle, colormap, 'k');
end
figure, imshow(rect_img), title("rectagles");

% get circles --> 0.6 <= rectang[circle] <= 0.85
c = find(rectangularity >= 0.6 & rectangularity <= 0.85);
numberofcircles = length(c);
fprintf("Circles count: %d\n", numberofcircles);
for i = c
    Circle(L == i) = true;
    colormap = [0 1 0];
    circle_img = label2rgb(Circle, colormap, 'k');
end
figure, imshow(circle_img), title("circles");



