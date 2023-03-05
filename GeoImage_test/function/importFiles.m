function fileInfo = importFiles()
%IMPORTFILES Summary of this function goes here
%   Detailed explanation goes here
% import files
[fname, pathn, indx] = uigetfile({'*.txt', 'Nzsensing data'; '*.xml', 'Silixa data'}, ...
    'Please select files','MultiSelect','on');

% convert to string of fname, in order to count and importdata
fname = string(fname);
pathn = string(pathn);
[~, fileCnt] = size(fname);

% output fileInfo
fileInfo.fileName = fname;
fileInfo.filePath = pathn;
fileInfo.fileCnt = fileCnt;
fileInfo.fileIndx = indx;

end

