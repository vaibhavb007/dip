function [ ] = myHarrisCornerDetector(A, firstSmoothing, secondSmoothing, k)
%Scaling the image
A = (A - min(min(A)))/(max(max(A))-min(min(A)));
figure(5),imshow(A,[])
%Blur the image initially
A = imgaussfilt(A, firstSmoothing);

%Sobel operator to compute the derivative
sobelOperator = [-1 0 1; -2 0 2; -1 0 1];

%Compute the derivative along X and Y
Ix = conv2(A, sobelOperator);
Iy = conv2(A, sobelOperator');

%Compute Ix2, Iy2, Ixy
Ix2 = Ix .* Ix;
Iy2 = Iy .* Iy;
Ixy = Ix .* Iy;

[m,n] = size(A);
p = 6 * secondSmoothing + 1;

Ix2Padded = padarray(Ix2, [p/2 p/2]);
Iy2Padded = padarray(Iy2, [p/2 p/2]);
IxyPadded = padarray(Ixy, [p/2 p/2]);

eigenMajor = zeros(m,n);
eigenMinor = zeros(m,n);
Cornerness = zeros(m,n);

for i = 1:m
    for j = 1:n
        gaussianSmoothingMask = fspecial('gaussian', [p, p], secondSmoothing);
        Sx2 = sum(sum(gaussianSmoothingMask .* Ix2Padded(i:i+p-1, j:j+p-1)));
        Sy2 = sum(sum(gaussianSmoothingMask .* Iy2Padded(i:i+p-1, j:j+p-1)));
        Sxy = sum(sum(gaussianSmoothingMask .* IxyPadded(i:i+p-1, j:j+p-1)));
        
        H = [Sx2 Sxy; Sxy Sy2];
        [v,d] = eig(H);
        eigenMajor(i,j) = max(max(d));
        eigenMinor(i,j) = min(max(H));
        Cornerness(i,j) = max(0, det(H) - k*trace(H)*trace(H));
        
    end
end
figure(4),imshow(A,[])
figure(1),imshow(eigenMajor,[])
figure(2),imshow(eigenMinor,[])
figure(3),imshow(Cornerness,[])

end