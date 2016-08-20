function [] = Display(name, input_Matrix, greyscale)
% Function to display any image with desired colourmap and axis
%   Detailed explanation goes here
myNumOfColors = 200;
myColorScale = [[0:1/(myNumOfColors-1):1]',[0:1/(myNumOfColors-1):1]',[0:1/(myNumOfColors-1):1]'];
if greyscale == 1
    figure('Name',name,'NumberTitle','off'), imagesc(input_Matrix)
else
    figure('Name',name,'NumberTitle','off'), imagesc(input_Matrix)
end
colormap (myColorScale)
colorbar
axis on
snapnow
%colormap jet;
daspect ([1 1 1]);



end

