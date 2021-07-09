function [spacescales,DoGs] = paperDoGs(img,K,sigma,levels,octaves)
    % Initialization of cell arrays
	spacescales = cell(1,octaves);
    DoGs = cell(1,octaves);
    
    % s is calculated to follow the paper's terms
    s = levels - 3;
    % k results from s
    k = 2^(1/s);
    
    for octave = 1:octaves
        L = zeros([size(img),levels]);
        % The sigma of each octave's start is double the last
        sigma_level = sigma*2^(octave-1);
        % The initial image of the octave is first convolved to produce L.
        L(:,:,1) = conv2(img,my2DGaussianFilter(K,sigma_level),'same');
        for level = 2:levels
            % Then sigma is recursively multiplied by k as we progress
            % through the levels of the octave
            sigma_level = sigma_level*k;
            L(:,:,level) = conv2(L(:,:,level-1),my2DGaussianFilter(K,sigma_level),'same');
        end
        % Space scales for the current octave are already calculated
        spacescales{octave} = L;
        % Differences of Gaussians are a simple result of subtraction
        DoGs{octave} = L(:,:,2:levels) - L(:,:,1:(levels-1));
        % In order to progress to the next octave the initial image changes
        % to a resampled version of L(s) where s is the level where
        % sigma_level is double the original of the octave
        img = imresize(L(:,:,s),0.5);
    end
end

