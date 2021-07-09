function showDoGs(array,octaves,levels, keypoints, showKeypoints)
    % At first, this function itterates octaves and levels as it
    % itterates subplots
    figure;
    ax = cell(octaves,levels);
    for i = 1:octaves
        for j = 1:levels
            % DoGs are however normalized for presentability
            img = array{i}(:,:,j);  
            mx = max(max(abs(img)));
            img = img/mx+0.5;
            % The axes of each plot are saved in case keypoint presentation
            % is required 
            ax{i,j} = subplot(octaves,levels,i*levels+j-levels);
            imshow(img);
        end
    end
    
    % Keypoints are presented on their respective DoGs. Saved axes are now
    % used to plot them on the correct subplot. Dimensions are transposed
    % due to the nature of the plot function.
    if(showKeypoints&&~isempty(keypoints{1}))
        for keypoint = 1:size(keypoints, 1)
            
            octave = keypoints{keypoint}(1);
            level = keypoints{keypoint}(2);
            x = keypoints{keypoint}(3);
            y = keypoints{keypoint}(4);
            
            axes(ax{octave,level});
            hold on
            plot(y, x, 'rx', 'LineWidth', 1);
            hold off
        end
    end
end

