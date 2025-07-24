%% Reading time traces (clean_tv, TimeVector...) - float64

fileName = fullfile('E:\Pipeline_Projects\database\2025\RBM\Met\clean_tv');
fid = fopen(fileName);
if fid >0
    tv = fread(fid,'float64');
    fclose(fid);
end
% converting time from Matlab datenum to Matlab datetime format
tv_dt = datetime(tv,'ConvertFrom','datenum');

%% Reading data traces - float32

fileName = fullfile('E:\Pipeline_Projects\database\2025\RBM\Met\MET_HMP_T_6m_Avg');
fid = fopen(fileName);
if fid >0
    TA_1_1_1 = fread(fid,'float32');
    fclose(fid);
end
