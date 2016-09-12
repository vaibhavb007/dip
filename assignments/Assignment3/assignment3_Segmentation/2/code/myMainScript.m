%% MyMainScript

tic;
%% Your code here
A = imread('../data/baboonColor.png', 'png');
B = imgaussfilt(A,1); % gaussian filtering
C=B(1:2:end,1:2:end,:); %subsampling
C = double(C);
[row,col,channel] = size(C);

w = 20;
spatialSigma= 10;
colorSigma = 10;
alpha = 1;
iteration = 20;

spatialGuass = fspecial('gaussian',2*w+1,spatialSigma);
image = padarray(C,[w,w],'symmetric');
finalImage = C;


for i = 1:iteration
    disp(i);
    for c = 1:3
        for x = 1:row
            for y = 1:col
                win = image(x:x+2*w,y:y+2*w,c);
                temp = win(:,:)-win(w+1,w+1);
                weight = (temp/colorSigma).^2;
                weight = exp(-1*weight);
                weight = (weight .* spatialGuass);
                numerator = weight.*win(:,:);
                numerator = sum(sum(numerator));
                denom = sum(sum(weight));
                meanShift = (numerator/denom)- win(w+1,w+1);
                
                image(x+w,y+w,c) = image(x+w,y+w,c) + alpha * meanShift;
            end
        end
    end
end

finalImage = image(w+1:w+row, w+1:w+col,:);
figure(2),imshow(C/255,[]);
figure(1),imshow(finalImage/255,[]);

toc;



