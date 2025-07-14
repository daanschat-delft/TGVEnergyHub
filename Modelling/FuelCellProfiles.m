clear; clc;

% Load minimal CSV with 'time' and 'value'
filename = 'Fuel_Cell_Inverter_AC_Power_matlab_ready.csv';
data = readtable(filename);

% Convert time column to datetime
data.time = datetime(data.time, 'InputFormat', 'yyyy-MM-dd HH:mm:ss');

% Plot
figure;
plot(data.time, data.value, 'LineWidth', 1.5);
xlabel('Time');
ylabel('Power Output');
title('Battery Inverter AC Output Power');
grid on;

%% --- Load Simulink model output ---

modelname = "TGV_EnergyHub_12_PVPanels_300_Ah_Battery.mat";
modeldata = load(modelname);

data1 = modeldata.results.PowerComponents.Data(:,1);   % Simulated power
data2 = modeldata.results.Hydrogen.Data(:,6);          % Simulated hydrogen

time1 = modeldata.results.PowerComponents.time;        % Seconds
time2 = modeldata.results.Hydrogen.time;

% Convert simulation time (in seconds) to datetime
%simStart = datetime(2025,1,1,0,0,0,'TimeZone','UTC');

%simTime1 = simStart; + seconds(time1);
%simTime2 = simStart; + seconds(time2);

% --- Plotting
TitleSize = 22;
LabelSize = 16;
AxisSize = 16;
LegendSize = 16;

clr = {'red', 'cyan'};
minlim = 0;
maxlim = 2500;

figure('Position', [100 100 1000 600]); hold on;

% Simulated data
plot(time1, data1, 'LineWidth', 3, 'Color', clr{1}, 'DisplayName', 'Simulated power');
plot(time2, data2, 'LineWidth', 3, 'Color', clr{2}, 'DisplayName', 'Simulated hydrogen');


% Plot settings
title('Electrolyser Power Consumption and Hydrogen Production', 'FontSize', TitleSize)
xlabel('Time [HH:MM]', 'FontSize', LabelSize)
ylabel('Power [W] / Hydrogen Flow [NL/h]', 'FontSize', LabelSize)
ylim([minlim maxlim])
xlim([start_date end_date])
grid on;

% Format x-axis
ax = gca;
ax.XAxis.FontSize = AxisSize;
ax.YAxis.FontSize = AxisSize;
ax.XTick = linspace(start_date, end_date, 13);  % 2-hour intervals
ax.XTickLabelRotation = 45;
datetick('x', 'HH:MM', 'keepticks');  % Optional: force time labels

legend('Location', 'northwest', 'FontSize', LegendSize);

hold off;