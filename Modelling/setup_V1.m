% Load .mat file
data = load('Dataframes/PV_inverter.mat');
PVPower = data.other_columns.value_float;
Time = 1:1:172741;

PVgeneration = timeseries(PVPower, Time);


disp(PVgeneration);

figure;
plot(PVgeneration);
xlabel('Time');
ylabel('PV Power');
title('PV Power Timeseries');
grid on;

%% Load Data import


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

% Constants
SecondsPerDay = 24 * 60 * 60;  % Number of seconds in a day
StartDay = 217;                % Start trimming from day 217
EndDay = StartDay + 1;         % Include 2 days after day 217

% Step 1: Convert days to time in seconds
StartTime = (StartDay - 1) * SecondsPerDay;  % Start of day 217
EndTime = EndDay * SecondsPerDay;            % End of day 219

% Step 2: Trim the data to the desired range
TrimIndices = t >= StartTime & t < EndTime;  % Logical mask for the desired range
TrimmedTime = t(TrimIndices);               % Filter time
TrimmedPower = PowerNorm(TrimIndices);      % Filter normalized power

time2 = 0:600:2*24*60*60-1;
% Optional: Save the trimmed data
PDemand = [transpose(time2), TrimmedPower];  % Combine into one matrix

%Pdemand = timeseries(LoadPower, t);


figure;
plot(t, LoadPower);
xlabel('Time');
ylabel('PV Power');
title('PV Power Timeseries');
grid on;

%%

% Load .mat file
data = load('Dataframes/Full Year Data/GTImin.mat');
GTI = data.value_float;
time = 1:1:527026;


% Convert the time data (if it's in serial date format) to datetime
% If time is already a datetime object, skip this step
time = datetime(2024, 1, 1) + minutes(time);

% Plot the entire data
figure;
plot(time, GTI);
title('Data Plot');
xlabel('Time');
ylabel('Value');
xtickformat('dd-MMM-yyyy HH:mm');
xtickangle(45);
grid on;

% Filter the data to the 217th day
% The 217th day of the year is 5th August (considering 2023 as the year)
start_date = datetime(2024, 1, 1) + days(218 - 1);
end_date = start_date + days(2);

% Find the indices of data that fall within the 217th day
idx_217th_day = time >= start_date & time < end_date;

% Filter the data
timedays = time(idx_217th_day);
GTI = GTI(idx_217th_day);

timedays2 = 1:60:2880*60

GTIdays = timeseries(GTI, timedays2);

% Plot the filtered data
figure;
plot(timedays, GTI);
title('Data for the 217th Day');
xlabel('Time');
ylabel('Value');
xtickformat('dd-MMM-yyyy HH:mm');
xtickangle(45);
grid on;
