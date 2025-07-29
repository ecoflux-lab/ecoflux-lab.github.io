%% get Canadian ECCC station data
structProject = set_TAB_project(projectPath);
stationIDs = [28051];
yearsIn = 2022:2023;
monthsIn  = 1:12;
for cntStations = 1:length(stationIDs)
    sID = stationIDs(cntStations);
    pathECCC = fullfile('yyyy','ECCC',num2str(sID));
    try
        run_ECCC_climate_station_update(yearsIn,monthsIn,sID,structProject.databasePath)
    catch
        fprintf('Error processing station: %d (year: %d, month: %d)\n',sID,yearsIn,monthsIn(end));
    end
end