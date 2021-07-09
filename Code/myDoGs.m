function [spacescales,DoGs] = myDoGs(img,K,sigma,levels,octaves)
    % Initialization of cell arrays
	spacescales = cell(1,octaves); 
    DoGs = cell(1,octaves);
    
    % k is set to sqrt(2) as requested by the assignment
    k = sqrt(2);
    
    % sigma_level represents the current sigma of each pyramid level/octave
    sigma_level = sigma;
    for octave = 1:octaves
        L = zeros([size(img),levels]);
        % The initial image of the octave is first convolved to produce L.
        L(:,:,1) = conv2(img,my2DGaussianFilter(K,sigma_level),'same');
        for level = 2:levels
            % Then sigma is recursively multiplied by k as we progress
            % through the levels of the octave
            sigma_level = k*sigma_level;
            L(:,:,level) = conv2(L(:,:,level-1),my2DGaussianFilter(K,sigma_level),'same');
        end
        % Space scales for the current octave are already calculated
        spacescales{octave} = L;
        % Differences of Gaussians are a simple result of subtraction
        DoGs{octave} = L(:,:,2:levels)-L(:,:,1:(levels-1));
        % In order to progress to the next octave the initial image changes
        % to a resampled version of L(3)
        img = imresize(L(:,:,3),0.5);
    end
end

