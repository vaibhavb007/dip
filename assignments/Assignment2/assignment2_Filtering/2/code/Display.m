%% Function - Display
% Function to display any image with desired colourmap and axis

function [] = Display(input_Matrix)

myNumOfColors = 200; 
myColorScale = [ [0:1/(myNumOfColors-1):1]' , [0:1/(myNumOfColors-1):1]' , [0:1/(myNumOfColors-1):1]' ]; 
imagesc(single(input_Matrix))
colormap (myColorScale);
daspect ([1 1 1]);  
axis tight;  
colorbar;

end

