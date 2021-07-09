%% Preparation
clear;

load dip_hw_3.mat

%% Mountains, 3 Octaces, 5 levels, with keypoints
[~,mountDoGs] = paperDoGs(mountains, 7, sqrt(2), 5, 3);
keypoints = myKeypoints(mountDoGs);
keypointsC = discardLowContrasted(mountDoGs, keypoints, 0.8);
showDoGs(mountDoGs,3,4,keypoints,true);
showDoGs(mountDoGs,3,4,keypointsC,true);

%% Roofs, 3 Octaces, 5 levels, with keypoints
[~,roofDoGs] = myDoGs(roofs, 7, sqrt(2), 5, 3);
keypoints = myKeypoints(roofDoGs);
keypointsC = discardLowContrasted(roofDoGs, keypoints, 0.8);
showDoGs(roofDoGs,3,4,keypoints,true);
showDoGs(roofDoGs,3,4,keypointsC,true);