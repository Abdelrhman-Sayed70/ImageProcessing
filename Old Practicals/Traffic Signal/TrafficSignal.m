% How to detect which signal is active now?

I = imread('2.jpg');
figure, imshow(I), title('Original Image');

[H, W, D] = size(I);
for i = 1 : H
    for j = 1 : W
        % red detection
        if I(i, j, 1) > 140 && I(i, j, 2) < 20 && I(i,j,2) < 20 
            light = 1;
            break;
        end
        % Green detection
        if I(i,j,2) > 200 && I(i,j,1) < 200 && I(i,j,3) < 200
            light = 2;
            break;
        end
        % Yellow detection
        if I(i, j, 1) > 200 && I(i, j, 2) > 150 && I(i, j, 3) < 100
            light = 3;
            break;
        end
    end
end

% display ans
if light == 1
    disp('Red is on');
end
if light == 2
    disp('Green is on');
end
if light == 3
    disp('Yellow is on');
end
