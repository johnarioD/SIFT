%% Preparation
clear;
img = double(rgb2gray(imread('./TestImages/Lenna.png')));
img = img/max(max(img));

%% Keypoint Discovery
tic
% [~,DoGs] = myDoGs(img, 20, sqrt(2), 5, 3);
[~,DoGs] = paperDoGs(img, 40, sqrt(2), 5, 3);
keypoints = myKeypoints(DoGs);
keypointsC = discardLowContrasted(DoGs, keypoints, 0.8);
toc

%% Plotting
tic
plotKeypoints(keypointsC, img);
% showDoGs(DoGs,3,4,keypointsC, true);
toc