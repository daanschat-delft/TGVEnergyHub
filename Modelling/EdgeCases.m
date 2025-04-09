%% System sizing
SolarPanels             = 12;                           % [#] (445 Wp)
DemandPower             = 2200;                         % [kWh]
HydrogenCapacity        = 48;                           % [kg]
HydrogenStartCapacity   = 0.5*HydrogenCapacity;         % [kg]


% Electrolyser
ElectrolyserWarming = 260;                    % [W] Electrolyser Warming Power Consumption
ElectrolyserPower = 2450;                     % [W] Electrolyser Max Power Consumption
ElectrolyserHyFlow = 510;                     % [NL/h] Hydrogen flow rate at max power
ElectrolyserWarmingTime = 12 * 60;            % [s] Warm up time 12 minutes in seconds
ElectrolyserRampUpTime = 10 * 60;             % [s] Time to go from 60 to 100% = 10 minutes in seconds
ElectrolyserRampDownTime = 30 * 60;           % [s] Time to go from 100 to 60%
ElectrolyserHoldTime = 25 * 60;               % [s] Time before electrolyser actually turns off after off signal


% Fuel cell:
FuelCellPower       = 2380;                   % [W] of electricity power (DC), is 1800 (AC) after inverter
FuelCellHyFlow      = 24;                     % [NL/min] (at full load)
FuelCellStartPower  = 580;                    % [W] of electricity power from start
FuelCellRampTime1   = 40;                     % [s] Ramp time from 0 to start power
FuelCellRampTime2   = 18*60;                  % [s] Ramp time from start power to full power
FuelCellRampDown    = 60;                     % [s] Ramp down from full power to 0 w


% Battery:
BatteryCapacity     = 15.36;                            % [kWh]
BatteryVNom         = 51.2;                             % [V]
BatteryInitialSoC   = 50;                               % [%]
BatteryCapacity     = 1000*BatteryCapacity/BatteryVNom; % [Ah]
GridExtra           = 0;                                % [W] Extra power to pull from the grid


% BoP:
WinterBase          = 235;                    % [W]
SummerBase          = 80;                     % [W]
FuelCellBoP         = 155;                    % [W]
FuelCellAirBlower   = 6.4*33.9;               % [W] draws 6.4 [A] directly from MPPT input
ElectrolyserBoP     = 80;                     % [W] BoP


% EMS:
EMSElecStartSoC     = 80;                     % [%] Min SoC to start the electrolyser (was 80)
EMSElecStartHr      = 12;                     % [h] Electrolyser starts before this hour (was 12)
EMSElecStopSoC      = EMSElecStartSoC-15;     % [%] Min SoC to stop the electrolyser (was 65)

EMSFCStartSoC       = 25;                     % [%] FC starts when this SoC is reached (was 25)
EMSFCStopSoC        = 90;                     % [%] FC stops when this SoC is reached (was 90)
EMSFCTimeThresholds = [13, 14, 15, 16, 17];   % [13, 14, 15, 16, 17];      % [%] Range of SoC values to turn on FC
EMSFCSoCThresholds  = [40, 50, 60, 70, 80];   % [40, 50, 60, 70, 80];      % [h] Range of time values to turn on FC
MinSoCGrid          = EMSFCStartSoC-5;


%% System sizing Improved V3

SolarPanels             = 21;                           % [#] (445 Wp)
DemandPower             = 2200;                         % [kWh]
HydrogenCapacity        = 70;                           % [kg]
HydrogenStartCapacity   = 30;         % [kg]


% Electrolyser
ElectrolyserWarming = 260;                    % [W] Electrolyser Warming Power Consumption
ElectrolyserPower = 2450;                     % [W] Electrolyser Max Power Consumption
ElectrolyserHyFlow = 510;                     % [NL/h] Hydrogen flow rate at max power
ElectrolyserWarmingTime = 12 * 60;            % [s] Warm up time 12 minutes in seconds
ElectrolyserRampUpTime = 10 * 60;             % [s] Time to go from 60 to 100% = 10 minutes in seconds
ElectrolyserRampDownTime = 30 * 60;           % [s] Time to go from 100 to 60%
ElectrolyserHoldTime = 25 * 60;               % [s] Time before electrolyser actually turns off after off signal


% Fuel cell:
FuelCellPower       = 2380;                   % [W] of electricity power (DC), is 1800 (AC) after inverter
FuelCellHyFlow      = 24;                     % [NL/min] (at full load)
FuelCellStartPower  = 580;                    % [W] of electricity power from start
FuelCellRampTime1   = 40;                     % [s] Ramp time from 0 to start power
FuelCellRampTime2   = 18*60;                  % [s] Ramp time from start power to full power
FuelCellRampDown    = 60;                     % [s] Ramp down from full power to 0 w


% Battery:
BatteryCapacity     = 2*15.36;                            % [kWh]
BatteryVNom         = 51.2;                             % [V]
BatteryInitialSoC   = 50;                               % [%]
BatteryCapacity     = 1000*BatteryCapacity/BatteryVNom; % [Ah]
GridExtra           = 0;                                % [W] Extra power to pull from the grid


% BoP:
WinterBase          = 235;                    % [W]
SummerBase          = 80;                     % [W]
FuelCellBoP         = 155;                    % [W]
FuelCellAirBlower   = 6.4*33.9;               % [W] draws 6.4 [A] directly from MPPT input
ElectrolyserBoP     = 80;                     % [W] BoP


% EMS:
EMSElecStartSoC     = 70;                     % [%] Min SoC to start the electrolyser (was 80)
EMSElecStartHr      = 14;                     % [h] Electrolyser starts before this hour (was 12)
EMSElecStopSoC      = 65;                     % [%] Min SoC to stop the electrolyser (was 65)

EMSFCStartSoC       = 15;                     % [%] FC starts when this SoC is reached (was 25)
EMSFCStopSoC        = 70;                     % [%] FC stops when this SoC is reached (was 90)
EMSFCTimeThresholds = [113, 114, 115, 116, 117];      % [13, 14, 15, 16, 17];      % [%] Range of SoC values to turn on FC
EMSFCSoCThresholds  = [140, 150, 160, 170, 180];      % [40, 50, 60, 70, 80];      % [h] Range of time values
MinSoCGrid          = EMSFCStartSoC-5;

% Power & Energy Calculations for demand and PV generation

TitleSize = 18;
FontSize = 14;


%% Demand V2:


TitleSize = 18;
FontSize = 14;
year_seconds = 365 * 24 * 3600;
target_kWh = 2200;
target_kWs = target_kWh * 3600; % Convert to kilowatt-seconds
baseline_power = 0.2; % Base power in kW

% Time vector
t = datetime(2024,1,1,0,0,0) + seconds(0:year_seconds-1);

% Preallocate demand array
demand = baseline_power + 0.1 * randn(1, year_seconds); % base + noise

% Add day-night variation (more use in evening)
hour_of_day = hour(t);
evening_boost = (hour_of_day >= 17 & hour_of_day <= 22) .* 0.2;
demand = demand + evening_boost;

% Add seasonal adjustment (more use in winter)
month_of_year = month(t);
winter_mask = (month_of_year == 12 | month_of_year == 1 | month_of_year == 2);
demand(winter_mask) = demand(winter_mask) + 0.1;

% Clip any negative values
demand(demand < 0) = 0;

% Add random spikes in winter (simulate high appliance usage)
n_spikes = 500; % number of spikes
winter_indices = find(winter_mask);
spike_indices = randsample(winter_indices, n_spikes);

for idx = spike_indices
    duration = randi([10 300]); % spike duration: 10s to 5min
    power = 2 + rand() * 2;     % power between 2 to 4 kW
    end_idx = min(idx + duration - 1, year_seconds);
    demand(idx:end_idx) = demand(idx:end_idx) + power;
end

% Normalise to match total 2200 kWh
current_total_kWs = sum(demand);
scale_factor = target_kWs / current_total_kWs;
PDemand = demand' * scale_factor;

time2 = 1:1:365*24*60*60;
PDemand = [transpose(time2), PDemand];  % Combine into one matrix

ScaledTotalEnergy = sum(demand)/3600;


% Optional: plot a random day for sanity check
figure('Position', [100 100 1000 600]);
plot(time2, PDemand(:,2),'LineWidth',3, 'color', [0.8 0 0]);
xlabel('Seconds');
xlim([0 365*24*60*60]);

ylabel('Power (kW)')
yline(mean(PDemand(:,2)), 'color' ,[0.3 0.3 0.3], 'LineStyle', '--', LineWidth= 3);

title('Residential load power demand profile - V2', 'FontSize',TitleSize)


% Save if needed
% save('residential_demand_profile.mat', 'demand');

%% Demand V1

Load = readtable("Load.xlsx");      % Loading the data
Load = table2array(Load(:,1:2));    % Loading the data in usable arrays
t = Load(:, 1);                     % Time [s]
PowerNorm = Load(:, 2);             % Normalised power [-]
EnergyHouse = 2200;          % Household energy use for 1 year for owner-occupied houses in 2021 in NL [kWh] https://www.cbs.nl/en-gb/figures/detail/81528ENG

% Step 1: Calculate the total energy consumption of your normalized load
TotalNormalizedEnergy = sum(PowerNorm) * 1/6;

% Step 2: Scaling factor needed to achieve make the power match the total energy:
ScalingFactor = EnergyHouse / TotalNormalizedEnergy;

% Step 3: Scaling the normalised load power data
LoadPower = PowerNorm * ScalingFactor;
TotalEnergy = sum(LoadPower);       % Energy for 1 year in kWh
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

%% PV V1
% Load .mat file
data = load('Dataframes/Full Year Data/GTImin.mat');
GTI = data.value_float;
time = 1:60:527026*60-1;

GTIdays = timeseries(GTI, time);

% Convert the time data (if it's in serial date format) to datetime
time = datetime(2024, 1, 1) + minutes(time);
