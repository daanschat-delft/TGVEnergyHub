%% System sizing
SolarPanels             = 12;                       % [#] (445 Wp)
DemandPower             = 2200;                     % [kWh]
HydrogenCapacity        = 48;                       % [kg]
HydrogenStartCapacity   = 0.5*HydrogenCapacity;     % [kg]


% Electrolyser
ElectrolyserWarming = 260;              % [W] Electrolyser Warming Power Consumption
ElectrolyserPower = 2450;               % [W] Electrolyser Max Power Consumption
ElectrolyserHyFlow = 510;               % [NL/h] Hydrogen flow rate at max power
ElectrolyserWarmingTime = 12 * 60;      % [s] Warm up time 12 minutes in seconds
ElectrolyserRampUpTime = 10 * 60;       % [s] Time to go from 60 to 100% = 10 minutes in seconds
ElectrolyserRampDownTime = 30 * 60;     % [s] Time to go from 100 to 60%
ElectrolyserHoldTime = 25 * 60;         % [s] Time before electrolyser actually turns off after off signal


% Fuel cell:
FuelCellPower       = 2380;     % [W] of electricity power (DC), is 1800 (AC) after inverter
FuelCellHyFlow      = 24;       % [NL/min] (at full load)
FuelCellStartPower  = 580;      % [W] of electricity power from start
FuelCellRampTime1   = 40;       % [s] Ramp time from 0 to start power
FuelCellRampTime2   = 18*60;    % [s] Ramp time from start power to full power
FuelCellRampDown    = 60;       % [s] Ramp down from full power to 0 w


% Battery:
BatteryCapacity     = 15.36;    % [kWh]
BatteryVNom         = 51.2;     % [V]
BatteryInitialSoC   = 50;       % [%]
BatteryCapacity     = 1000*BatteryCapacity/BatteryVNom; % [Ah]
GridExtra           = 0;                % [W] Extra power to pull from the grid


% BoP:
WinterBase          = 235;              % [W]
SummerBase          = 80;               % [W]
FuelCellBoP         = 155;              % [W]
FuelCellAirBlower   = 6.4*33.9;         % [W] draws 6.4 [A] directly from MPPT input
ElectrolyserBoP     = 80;               % [W] BoP


% EMS:
EMSElecStartSoC     = 80;       % [%] Min SoC to start the electrolyser (was 80)
EMSElecStartHr      = 12;       % [h] Electrolyser starts before this hour (was 12)
EMSElecStopSoC      = 65;       % [%] Min SoC to stop the electrolyser (was 65)

EMSFCStartSoC       = 25;       % [%] FC starts when this SoC is reached (was 25)
EMSFCStopSoC        = 90;       % [%] FC stops when this SoC is reached
EMSFCSoCThresholds  = [13, 14, 15, 16, 17];      % [13, 14, 15, 16, 17];      % [%] Range of SoC values to turn on FC
EMSFCTimeThresholds = [40, 50, 60, 70, 80];      % [40, 50, 60, 70, 80];      % [h] Range of time values to turn on FC


% Power & Energy Calculations for demand and PV generation

TitleSize = 18;
FontSize = 14;

Load = readtable("Load.xlsx");      % Loading the data
Load = table2array(Load(:,1:2));    % Loading the data in usable arrays
t = Load(:, 1);                     % Time [s]
PowerNorm = Load(:, 2);             % Normalized power [-]
EnergyHouse = DemandPower;                 % Household energy use for 1 year for owner-occupied houses in 2021 in NL [kWh] https://www.cbs.nl/en-gb/figures/detail/81528ENG

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
PDemand = [transpose(time2), LoadPower];  % Combine into one matrix

data = LoadPower*1000;
time = time2;

minlim = 0;
maxlim = 1.1*max(data);

figure('Position', [100 100 1000 600]);
plot(time, data, 'LineWidth',3, 'color', [0.8 0 0])
yline(mean(LoadPower)*1000, 'color' ,[0.3 0.3 0.3], 'LineStyle', '--', LineWidth= 3);
ax = gca;
grid on
title('Residential load power demand profile', 'FontSize',TitleSize)
ylabel('Power [W]', FontSize=FontSize)
xlabel('Time',FontSize=FontSize)

xlim([min(time) max(time)])
ylim([minlim maxlim])
xtick_positions = linspace(min(time), max(time), 12 + 1); % 12 intervals
month_labels = {'Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', ...
                'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec'};
ax.XAxis.FontSize = FontSize; 
ax.YAxis.FontSize = FontSize;
xticks(xtick_positions);
xticklabels(month_labels);
legend('Power demand','average power','Location', 'northeast', 'FontSize', FontSize);


% Load .mat file
data = load('Dataframes/Full Year Data/GTImin.mat');
GTI = data.value_float;
time = 1:60:527026*60-1;

GTIdays = timeseries(GTI, time);

% Convert the time data (if it's in serial date format) to datetime
% If time is already a datetime object, skip this step
time = datetime(2024, 1, 1) + minutes(time);

%% Multiple combination testing 
% Different combinations to try:
% PV Panels (per 3)                                 (Integration test)
% Batteries 1 to 4 X 15 kWh                         (Integration test)
% Fuel Cell power 1.2 kW to 1.8 kW in 300 W         (Integration test)
% Electrolyser power 1.2 to 3.6 kW in 1.2 kW        (Integration test)
% Electrolyser start time 12 - 15 in 0.5h intervals (EMS Test)
% Electrolyser start SoC 70 to 80 in 5%             (EMS Test)
% Electrolyser Stop SoC 65 to 50 in 5%              (EMS Test)

SolarPanels = 12:3:18; % Example values for param1
ElectrolyserHyFlow = 510:10:520;                    % Example values for param2
BatteryCapacity     = 15.36:15.36:15.36*4;          % [kWh]
FuelCellPower       = 1.2e3:300:1.8e3;              % [W] of electricity power
FuelCellHyFlow      = FuelCellPower*24/1800;        % [NL/min] (at full load)
ElectrolyserPower = 2450/2:2450/2:2450*1.5;         % [W] Electrolyser Max Power Consumption
ElectrolyserHyFlow = ElectrolyserPower*510/2450;    % [NL/h] Hydrogen flow rate at max power

EMSElecStartSoC     = 70:5:80;                      % [%] Min SoC to start the electrolyser 
EMSElecStartHr      = 12:0.5:15;                    % [h] Electrolyser starts before this hour (was 12)
EMSElecStopSoC      = 50:5:65;                      % [%] Min SoC to start the electrolyser

% Generate all combinations of param1 and param2
[param1_grid, param2_grid] = ndgrid(SolarPanels, ElectrolyserHyFlow);
param_combinations = [param1_grid(:), param2_grid(:)]; % Reshape to a list

results = struct(); % Store results
num_simulations = size(param_combinations, 1);

for i = 1:num_simulations
    param1 = param_combinations(i, 1);
    param2 = param_combinations(i, 2);
    
    % Set parameters in the MATLAB base workspace
    assignin('base', 'SolarPanels', param1);
    assignin('base', 'ElectrolyserHyFlow', param2);
    
    % Run the simulation
    simOut = sim('EnergyHub_V3.slx');

    % Store results
    results(i).param1 = param1;
    results(i).param2 = param2;
    results(i).time = simOut.tout;
    results(i).PV_Energy = simOut.logsout.get('PVEnergy').Values.Data;
    results(i).Hydrogen_Produced = simOut.logsout.get('HyProduced').Values.Data;
    results(i).Hydrogen_Consumed = simOut.logsout.get('HyConsumed').Values.Data;
    fprintf('Simulation %d/%d completed: param1=%.2f, param2=%.2f\n', ...
            i, num_simulations, param1, param2);
end

save('simulation_results.mat', 'results', '-v7.3')

%% Multiple combination testing 
% Different combinations to try:
% PV Panels (per 3)                                 (Integration test)
% Batteries 1 to 4 X 15 kWh                         (Integration test)
% Fuel Cell power 1.2 kW to 1.8 kW in 300 W         (Integration test)
% Electrolyser power 1.2 to 3.6 kW in 1.2 kW        (Integration test)
% Electrolyser start time 12 - 15 in 0.5h intervals (EMS Test)
% Electrolyser start SoC 70 to 80 in 5%             (EMS Test)
% Electrolyser Stop SoC 65 to 50 in 5%              (EMS Test)

SolarPanels = 12:3:18; % Example values for param1
BatteryCapacity     = 15.36:15.36:15.36*2;          % [kWh]
BatteryVNom         = 51.2;     % [V]
BatteryInitialSoC   = 50;       % [%]
BatteryCapacity     = 1000*BatteryCapacity/BatteryVNom; % [Ah]

%ElectrolyserHyFlow = 510:10:520;                    % Example values for param2
%FuelCellPower       = 1.2e3:300:1.8e3;              % [W] of electricity power
%FuelCellHyFlow      = FuelCellPower*24/1800;        % [NL/min] (at full load)
%ElectrolyserPower = 2450/2:2450/2:2450*1.5;         % [W] Electrolyser Max Power Consumption
%ElectrolyserHyFlow = ElectrolyserPower*510/2450;    % [NL/h] Hydrogen flow rate at max power

%EMSElecStartSoC     = 70:5:80;                      % [%] Min SoC to start the electrolyser 
%EMSElecStartHr      = 12:0.5:15;                    % [h] Electrolyser starts before this hour (was 12)
%EMSElecStopSoC      = 50:5:65;                      % [%] Min SoC to start the electrolyser

%EMSFCStopSoC        = [60 85 90];       % [%] FC stops when this SoC is reached

downsample_factor = 10; % Keep every 10th data point

% Generate all combinations of param1 and param2
[param1_grid, param2_grid] = ndgrid(SolarPanels, BatteryCapacity);
param_combinations = [param1_grid(:), param2_grid(:)]; % Reshape to a list

results = struct(); % Store results
num_simulations = size(param_combinations, 1);

for i = 1:num_simulations
    param1 = param_combinations(i, 1);
    param2 = param_combinations(i, 2);
    begin = now;
    fprintf('\nStarting sim with %d/%d at %s: param1=%.2f, param2=%.2f\n', ...
            i, num_simulations, datestr(begin, 'HH:MM:SS'), param1, param2);
    % Set parameters in the MATLAB base workspace
    assignin('base', 'SolarPanels', param1);
    assignin('base', 'BatteryCapacity', param2);
    
    % Run the simulation
    simOut = sim('EnergyHub_V4_2.slx');

    % Store results
    results(i).param1 =             param1;
    results(i).param2 =             param2;
    results(i).time =               simOut.tout;
    results(i).efficiency =         simOut.efficiency;
    results(i).PV_Demand =          simOut.PV_Demand;
    results(i).PowerComponents =    simOut.PowerComponents;
    results(i).StateOfCharge =      simOut.StateOfCharge;
    results(i).Grid =               simOut.Grid;
    results(i).Time =               simOut.Time;
    results(i).Hydrogen =           simOut.Hydrogen;

    fprintf('Simulation %d/%d completed at %s: param1=%.2f, param2=%.2f\n', ...
            i, num_simulations, datestr(now, 'HH:MM:SS'), param1, param2);
    
    simtime = now-begin;

    fprintf('Simulation %d/%d lasted %s ', ...
            i, num_simulations, datestr(simtime, 'HH:MM:SS'));

end

save('simulation_results_battery_pvpanels_arrays.mat', 'results', '-v7.3')
