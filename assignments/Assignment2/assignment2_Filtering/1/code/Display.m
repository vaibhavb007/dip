%% Function - Display
% Function to display any image with desired colourmap and axis

function [] = Display(name, input_Matrix)
figure('Name',name,'NumberTitle','off'), imshow(input_Matrix,[])
colorbar
axis on

end

