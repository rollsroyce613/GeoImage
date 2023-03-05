function DTS = loadDTSData(fname, pathn, fileCnt, indx)
%IMPORTDTSDATA Summary of this function goes here

% Get temprature, time, start time of the trail
if (indx == 1) % Nanzee Sensing
    % Get the min num of monitoring point along the Optical Fiber
    posiCnt = 0;
    for i = 1 : fileCnt
        tData = importdata(strcat(pathn, fname(i)));
        [m, ~] = size(tData.data);
        if (m < posiCnt || posiCnt == 0)
            posiCnt = m;
        end
    end
    
    % Get the temp result data: startTime, Length along fiber, Temperature
    tLAF = zeros(posiCnt, 1);
    tTMP = zeros(posiCnt, fileCnt);
    tTime = strings(1, fileCnt);
    for i = 1 : fileCnt
        tData = importdata(strcat(pathn, fname(i)));
        T = char(tData.textdata{1, 1});
        tTime(i) = string(T(6:end));
        tTMP(:,i) = tData.data(1:posiCnt, 3);
    end
    tLAF(:, 1) = tData.data(1:posiCnt, 2);
    startTime = datetime(tTime,'InputFormat','yyyy-MM-dd HH:mm:ss');
    
    % output result DTS
    DTS.startTime = startTime;
    DTS.LAF = tLAF;
    DTS.TMP = tTMP;

elseif (indx == 2) % Silixa sensing
   
else
    fprintf("import files failed!");
    DTS = null;
end

end

