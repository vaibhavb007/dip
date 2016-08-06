function [B] = adaptiveHistogram(A)
    T = num2cell(A,1);
    
    counter=cell(size(T));
    counter(:)=num2cell((1:numel(T))/numel(T));
    
    B = cellfun(@calculateIntensity,T,counter);
    B = B';
end

function [x] = calculateIntensity(A,counter)
    
    persistent waitbarh;

    if isempty(waitbarh) || ~ishandle(waitbarh)
        waitbarh=waitbar(0,'cellfun is working...'); 
    end

    waitbar(counter,waitbarh);

    B = equalizeChannel(A);
    x = B((size(B,1)+1)/2);
    
    if counter==1 % last call
        close(waitbarh);
    end
    
end

