function myGFilter = my2DGaussianFilter(K, sigma)
    % At the begining the two constant factors of the gaussian function are
    % precalculated to avoid further computational complexity
    c1 = 1/(2*pi*sigma^2);
    c2 = 1/(2*sigma^2);
    
    % Point (0,0) of the gaussian filter must be in the center of the
    % matrix
    center = (K+1)/2;
    
    % A grid is created where each cell value is equalt to the square sum
    % of it coordinates.
    grid = 1:K;
    grid = (grid-center).^2;
    grid = grid + grid';
    
    % When multiplied by the correct constants and exponentiated it becomes
    % a Gaussian Filter, which is then normalized
    myGFilter = c1*exp(-grid*c2);    
    myGFilter = myGFilter/sum(sum(myGFilter));
end

