function showSpace(array,octaves,levels)
    % Simply enough this function itterates octaves and levels as it
    % itterates subplots
    figure;
    for i = 1:octaves
        for j = 1:levels
            img = array{i}(:,:,j);            
            subplot(octaves,levels,i*levels+j-levels);
            imshow(img);
        end
    end
end

