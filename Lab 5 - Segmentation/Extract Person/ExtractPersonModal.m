I = imread('jump.jpg');
figure,imshow(I), title("Jump");

r = I(:, :, 1);
g = I(:, :, 2);
b = I(:, :, 3);
blueness = double(b) - max(double(r), double(g));

J = blueness < 25;
figure,imshow(J), title("Without blueness");

J = medfilt2(J, [3, 3]);
figure,imshow(J), title("After med filter");

BW = edge(J,'canny');
figure,imshow(BW), title("Edges");

se = strel('square', 5);
BW = imdilate(BW,se);
figure,imshow(BW), title("Edges 2");

BW = ~BW;
figure,imshow(BW);

[L, num] = bwlabel(BW);
RGB = label2rgb(L);
figure,imshow(RGB);

[h, w, ~] = size(I);
smallRatio = h * w * 0.002;
for i=1:num
    x = uint8(L==i);
    f = sum(sum(x==1));
    if(f < smallRatio)
        continue;
    end
    d = zeros(size(I));
    d(:,:,1) = uint8(x).*I(:,:,1);
    d(:,:,2) = uint8(x).*I(:,:,2);
    d(:,:,3) = uint8(x).*I(:,:,3);

    figure,imshow(uint8(d));
end

MAN = uint8(d);
figure,imshow(MAN), title("Jump Man");
