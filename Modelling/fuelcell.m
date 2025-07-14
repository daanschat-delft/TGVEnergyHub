clear; clc;

%% --- Load Measured CSV Data ---
filename = 'Fuel_Cell_Inverter_AC_Power_matlab_ready.csv';
measData = readtable(filename);
measData.time = datetime(measData.time, 'InputFormat', 'yyyy-MM-dd HH:mm:ss');

%% --- Load Simulink Model Output ---
modelname = "TGV_EnergyHub_12_PVPanels_300_Ah_Battery.mat";
modeldata = load(modelname);

simPower = modeldata.results.PowerComponents.Data(:,1);  % Simulated power
simHydrogen = modeldata.results.Hydrogen.Data(:,6);      % Simulated hydrogen
simTime1 = modeldata.results.PowerComponents.time;        % Time (seconds)
simTime2 = modeldata.results.Hydrogen.time;

% Convert sim time (seconds) to datetime (fake, arbitrary start time)
simStart = datetime(2025,1,1,0,0,0);  % Arbitrary reference point
simDatetime1 = simStart + seconds(simTime1);
simDatetime2 = simStart + seconds(simTime2);

%% --- Plot All on Same Figure ---
start_date = datetime(2025,1,13,0,0,0);
end_date   = datetime(2025,1,14,0,0,0);


simStart = datetime(2025,1,1,0,0,0);
simDatetime1 = simStart + seconds(simTime1)- hours(7);
simDatetime2 = simStart + seconds(simTime2)- hours(7);


% Plot using datetime x-values
figure('Position', [100 100 1000 600]); hold on;
plot(simDatetime1, simPower, 'LineWidth', 3, 'Color', 'red', 'DisplayName', 'Simulated Power');
plot(simDatetime2, simHydrogen, 'LineWidth', 3, 'Color', 'cyan', 'DisplayName', 'Simulated Hydrogen');
plot(measData.time, measData.value, 'LineWidth', 3, 'Color', 'blue', 'DisplayName', 'Measured Power');

% Apply datetime-based limits and ticks
ax = gca;
ax.XTick = start_date:hours(2):end_date;
ax.XTickLabelRotation = 45;
ax.XAxis.TickLabelFormat = 'HH:mm';  % Time format


TitleSize = 22;
LabelSize = 16;
AxisSize = 16;
LegendSize = 16;
clr = {'red', 'cyan', 'blue'};
minlim = 0;
maxlim = 2500;

figure('Position', [100 100 1000 600]); hold on;

% Simulated data
plot(simDatetime1, simPower, 'LineWidth', 3, 'Color', clr{3}, 'DisplayName', 'Simulated Power');
plot(simDatetime2, simHydrogen, 'LineWidth', 3, 'Color', clr{2}, 'DisplayName', 'Simulated Hydrogen');
xlim([start_date end_date-hours(2)])

% Plot settings
title('Fuel Cell Power Generation and Hydrogen Consumption', 'FontSize', TitleSize)
xlabel('Time [HH:MM]', 'FontSize', LabelSize)
ylabel('Power [W] / Hydrogen Flow [NL/h]', 'FontSize', LabelSize)
legend('Location', 'northeast', 'FontSize', LegendSize);
% Measured data
plot(measData.time, measData.value,'--', 'LineWidth', 3, 'Color', clr{3}, 'DisplayName', 'Measured Inverter AC Power');

%% --- Plot Settings ---
title('Measured vs Simulated Power and Hydrogen Flow', 'FontSize', TitleSize)
xlabel('Time', 'FontSize', LabelSize)
ylabel('Power [W] / Hydrogen Flow [NL/h]', 'FontSize', LabelSize)
ylim([minlim maxlim])

% Set x-axis range automatically (or manually, if desired)
%start_date = min([measData.time(1); simDatetime1(1); simDatetime2(1)]);
%end_date   = max([measData.time(end); simDatetime1(end); simDatetime2(end)]);

grid on;
ax = gca;
ax.XAxis.FontSize = AxisSize;
ax.YAxis.FontSize = AxisSize;

% Format x-axis
xticks = linspace(start_date, end_date, 13);
xticks = linspace(start_date, end_date, 13);
ax.XTick = xticks;
ax.XTickLabelRotation = 45;
datetick('x', 'HH:MM', 'keepticks')

legend('Location', 'northwest', 'FontSize', LegendSize);
hold off;