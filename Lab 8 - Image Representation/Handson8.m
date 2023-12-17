I = imread('TestCase1.png');
figure, imshow(I), title('orig. image');

grI = rgb2gray(I);
figure, imshow(grI), title('gray image');

% negate image to make objects filled with white [pre processing for bwlabel]
baseI = ~grI;
figure, imshow(baseI), title('image in base form');

% objects segmentation
[L, num] = bwlabel(baseI);
figure, imshow(L), title('segmented objects');
rgbL = label2rgb(L);
figure, imshow(rgbL), title('segmented objects (rgb)');
fprintf("Objects count: %d\n", num);

% create matrix for different shapes
Trianlge = zeros(size(L));
Star = zeros(size(L));
Circle = zeros(size(L));
Rectangle = zeros(size(L));

% get properties for each object
stats = regionprops(L, "Perimeter", "Area", "Extent");

% get rectangularity (extent) --> [identify rectangle from circle]
rectangularity = [stats.Extent];

% calc circularity --> [identify star from traingle]
circularity = [stats.Perimeter].^2 ./ (4 * pi * [stats.Area]);


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


% get stars --> circularity > 2
s = find(circularity > 2);
numberofstars = length(s);
fprintf("Stars count: %d\n", numberofstars);
for i = s
    Star(L == i) = true;
    colormap = [0 0 1];
    star_img = label2rgb(Star, colormap, 'k');
end
figure, imshow(star_img), title("stars");


% get triangles
t = find(rectangularity > 0.5 & rectangularity < 0.6);
numberoftriangles = length(t);
fprintf("Triangles count: %d\n", numberoftriangles);
for i = t
    Trianlge(L == i) = true;
    colormap = [1 1 0];
    triangle_img = label2rgb(Trianlge, colormap, 'k');
end
figure, imshow(triangle_img), title("triangles");


% final image
finalImg = uint8(triangle_img + star_img + circle_img + rect_img);
figure, imshow(finalImg), title('Final Image');
