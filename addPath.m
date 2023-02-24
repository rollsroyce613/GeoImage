
clear
clc
% Get the Current path of this file 'addPath.m'
fullpath = mfilename('fullpath');
[path, name] = fileparts(fullpath);

% Add Folder and Its Subfolders to Search Path
addpath(genpath(path));
cd(path);

fakeCodePath = './ATRT_example/fake_code/';
% Open all '*.mlx' files in ATRT_example/fake_code/
mlxListing = dir([fakeCodePath,'*.mlx']);
[mlxNum, ~] = size(mlxListing);
if (mlxNum > 0)
    for i = 1 : mlxNum
        edit(strcat(fakeCodePath, mlxListing(i).name));
    end
end
% Open all '*.m' files in ATRT_example/fake_code/
mListing = dir([fakeCodePath,'*.m']);
[mNum, ~] = size(mListing);
if (mNum > 0)
    for i = 1 : mNum
        edit(strcat(fakeCodePath, mListing(i).name));
    end
end

clear
clc
