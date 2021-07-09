function keypoints = myKeypoints(DoGs)
    
    % Number of octaves is extracted from the cell array
    octaves = length(DoGs);
    
    % A utility index is initialized
    idx = 0;
    
    % The keypoint array begins empty
    keypoints = cell(1);
    for octave = 1:octaves
        DoG = DoGs{octave}; % The current DoG is extracted
        levels = size(DoG,3); % The amount of levels in the DoG is also extracted
        for level = 2:(levels-1) % Comparisons start for pixels that have all 26 neighbours
            for x = 2:(size(DoG,1)-1)
               for y = 2:(size(DoG,2)-1)
                   % The area for which comparisons are made is isolated
                   area = DoG((x-1:x+1),(y-1:y+1),(level-1):(level+1));
                   % Comparisons are made and keypoints are added
                   % accordingly
                   if(prod(area <= area(2,2,2)))
                       idx = idx+1;
                       keypoints{idx,1} = [octave,level,x,y];
                   elseif(prod(area >= area(2,2,2)))
                       idx = idx+1;
                       keypoints{idx,1} = [octave,level,x,y];
                   end
               end
            end
        end
    end
end

