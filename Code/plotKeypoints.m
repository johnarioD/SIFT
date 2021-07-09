function plotKeypoints(keypoints, img)
    figure;
    imshow(img);
    N = size(img,2);
    % If there's at least one keypoint the funcion starts plotting ont the
    % image
    if(~isempty(keypoints{1}))
        hold on
        for keypoint = 1:size(keypoints, 1)
            % The scaling factor compensates for the resampling done in
            % myDoGs
            scale = 2^(keypoints{keypoint}(1) - 1);
            x = keypoints{keypoint}(3);
            y = keypoints{keypoint}(4);
            % Dimensions are transposed since plotting begins at the
            % bottom-left corner while images begin at the top-left.
            plot(y*scale, x*scale, 'rx', 'LineWidth', 1);
        end
        hold off
    end
end