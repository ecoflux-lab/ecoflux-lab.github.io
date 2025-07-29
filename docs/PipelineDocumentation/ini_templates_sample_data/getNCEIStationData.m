%% get US station data
% 31km away: 72493023230 (Oakland international airport, 2021-2024, TA&P)
% - Station list can be found at: https://www.ncei.noaa.gov/pub/data/noaa/isd-history.txt
% - stationID is the USAF and WBAN numbers combined into an 11-digit number
% - Map view of ISD stations: https://www.ncei.noaa.gov/access/search/data-search/global-hourly
structProject = set_TAB_project(projectPath); 
stationIDs = {'72493023230'};
UTC_offset = [-8];
yearRng = 2019:2024; 

for cntStations = 1:length(stationIDs) 
    sID = stationIDs{cntStations};
    UTC2local = UTC_offset(cntStations);
    dbPath = fullfile(structProject.databasePath,'yyyy','NCEI',sID); 
    for yearIn = yearRng
        try 
            db_NCEI_climate_station(yearIn,UTC2local,sID,dbPath,'60MIN') 
        catch 
            fprintf('Error processing station: %s, Year: %d\n',sID,yearIn); 
        end 
    end
end