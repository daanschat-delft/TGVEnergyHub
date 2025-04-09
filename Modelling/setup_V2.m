%% Power & Energy Calculations

Load = readtable("Load.xlsx");      % Loading the data
Load = table2array(Load(:,1:2));    % Loading the data in usable arrays
t = Load(:, 1);                     % Time [s]
PowerNorm = Load(:, 2);             % Normalized power [-]
EnergyHouse = 2200;                 % Household energy use for 1 year for owner-occupied houses in 2021 in NL [kWh] https://www.cbs.nl/en-gb/figures/detail/81528ENG

% Step 1: Calculate the total energy consumption of your normalized load
% power data:
TotalNormalizedEnergy = sum(PowerNorm) * 1/6;

% Step 2: Scaling factor needed to achieve make the power match the total energy:
ScalingFactor = EnergyHouse / TotalNormalizedEnergy;

% Step 3: Scaling the normalised load power data
LoadPower = PowerNorm * ScalingFactor;
TotalEnergy = sum(LoadPower);                               % Energy for 1 year in kWh
% Step 3 (optional): Verify the scaled energy matches EnergyHouse
ScaledTotalEnergy = sum(LoadPower) * 1/6;

time2 = 0:600:365*24*60*60-1;
% Optional: Save the trimmed data
PDemand = [transpose(time2), LoadPower];  % Combine into one matrix

%Pdemand = timeseries(LoadPower, t);


figure;
plot(t, LoadPower);
xlabel('Time');
ylabel('PV Power');
title('PV Power Timeseries');
grid on;

%% GTI

% Load .mat file
data = load('Dataframes/Full Year Data/GTImin.mat');
GTI = data.value_float;
time = 1:60:527026*60-1;

GTIdays = timeseries(GTI, time);

% Convert the time data (if it's in serial date format) to datetime
% If time is already a datetime object, skip this step
time = datetime(2024, 1, 1) + minutes(time);

