%% Function - myLinearContrastStretching
% My LinearContrastStretching uses the formula
% new_intensity = (old_intensity - min_intensity)/(max_intensity -
% min_intensity) * 255
% to map old intensities to range [0,255]

function [output] = myLinearContrastStretching(input)

if size(input,3) == 3
   disp('here');
   for i=1:size(input,3)
        output(:,:,i) = performLinearstretch(input(:,:,i));
   end
   
else
   output = performLinearstretch(input);
end
end

function [output] = performLinearstretch(input)
   min1 = min(min(input)); % minimum gray value of the image
   max1= max(max(input)); % maximum gray value of the image
   output = round((input-min1)* (255/(max1-min1)));% Linear contrast stretching applied to the entire image.  
    
end
