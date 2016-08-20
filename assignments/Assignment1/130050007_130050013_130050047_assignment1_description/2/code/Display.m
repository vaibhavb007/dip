function [] = Display(name, input_Matrix, greyscale)
% Function to display any image with desired colourmap and axis

myNumOfColors = 200;
myColorScale = [[0:1/myNumOfColors-1:1]',[0:1/myNumOfColors-1:1]',[0:1/myNumOfColors-1:1]'];
figure('Name',name,'NumberTitle','off'), imshow(input_Matrix)
colorbar
axis on
%colormap jet;
daspect ([1 1 1]);



end

