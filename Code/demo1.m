%% Preparation
clear;

load dip_hw_3.mat;

%% Mountains, 3 Octaces, 5 levels
[mountSpace,mountDoGs] = myDoGs(mountains, 7, sqrt(2), 5, 3);
showSpace(mountSpace,3,5);
showDoGs(mountDoGs,3,4,{},false);

%% Roofs, 3 Octaces, 5 levels
[roofSpace,roofDoGs] = myDoGs(roofs, 7, sqrt(2), 5, 3);
showSpace(roofSpace,3,5);
showDoGs(roofDoGs,3,4,{},false);

%% Mountains, 7 Octaces, 3 levels
[mountSpace,mountDoGs] = myDoGs(mountains, 7, sqrt(2), 3, 7);
showSpace(mountSpace,7,3);
showDoGs(mountDoGs,7,2,{},false);

%% Roofs, 7 Octaces, 3 levels
[roofSpace,roofDoGs] = myDoGs(roofs, 7, sqrt(2), 3, 7);
showSpace(roofSpace,7,3);
showDoGs(roofDoGs,7,2,{},false);