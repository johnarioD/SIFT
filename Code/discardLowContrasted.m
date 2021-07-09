function keypointsHighC = discardLowContrasted(DoGs, keypoints, p)
    keypointsHighC = cell(1);
    
    % A check is done to make sure there is at least one keypoint as input.
    if(isempty(keypoints{1}))
        fprintf("No keypoints found\n");
        return;
    end
    
    % Calculations almost explicitly follow the assignemt
    idx = 0;
    for i = 1:length(keypoints)
        keypoint = keypoints{i};
        
        octave = keypoint(1);
        level = keypoint(2);
        x = keypoint(3);
        y = keypoint(4);
        
        w = DoGs{octave}(x,y,level);
        nspo = size(DoGs{octave},3);
        t = 0.015*(2^(1/nspo)-1)/(2^(1/3)-1);
        
        if(w > p*t)
            idx = idx+1;
            keypointsHighC{idx,1} = keypoint;
        end
    end
end

