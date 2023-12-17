I = imread('4.png');
figure, imshow(I), title('original img');

% process
[h, w, c] = size(I);
s = ones(h, w, c) * 255;
for i = 1 : h
    for j = 1 : w
        if I(i, j, 1) == 237 && I(i, j, 2) == 28 && I(i, j, 3) == 36
            s(i, j, :) =  I(i, j, :);  
        end   
         
    end
end

% output
figure, imshow(uint8(s));