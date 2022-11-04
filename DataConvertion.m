% Fleet Data Analytics Example
% Rajat Dhawan 30/10/2022

cd('C:\Users\dhawa\Notebooks\MATLAB\FleetDataAnalytics')

% Data Read
ClfFiles=dir('Data/MAT/*.clf');
disp ('Total number of Clf Files: ',length(ClfFiles))

for i=1:length(ClfFiles)

    filename=ClfFiles.name[i];
    disp('Working on File No',i,': ',filename)
    
    % Data Convert using API/DOS Command
    command=['A CAN1.dbc CAN2.dbc CAN3.dbc',filename 'Data/MDF/'];
    dos(command)
    
    % Lets assume 1 CLF breaks down into 10 MDFs
    MdfFiles=dir('Data/MDF/*.mdf');
    disp ('Total number of MDF files: ',length(MdfFiles))

    for j=1:length(MdfFiles) % This loop will run for 10 files

        filename=MdfFiles.name[i];
        disp('Working on File No',j,': ',filename)
        
        % Data Convert using API/DOS Command
        command=['A CAN1.dbc CAN2.dbc CAN3.dbc',filename 'Data/MAT/'];
        dos(command)

    end
end

% Data Transfer to project folders
% ProjectX/MAT/V01
% ProjectX/MAT/V02
%
% ProjectX/MAT/V50


