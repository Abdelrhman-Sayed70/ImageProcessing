I = imread('brown.JPG');
[h, w, c] = size(I);
s = zeros(h,w,c);
for i=1:h
    for j = 1:w
        if I(i,j,1) > 100 && I(i,j,1) > (I(i,j,2)+20) && I(i,j,2) > (I(i,j,3)+20)
            s(i,j,:) = I(i,j,:);
        end
    end
end
figure, imshow(I), title('Original Image');
figure, imshow(uint8(s)), title('Extracted Chairs');