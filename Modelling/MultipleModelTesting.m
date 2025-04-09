%% Multiple model testing:

%Test 1:
%SolarPanels = 21;
%BatteryCapacity     = 2*15.36;    % [kWh]
%BatteryVNom         = 51.2;     % [V]
%BatteryInitialSoC   = 50;       % [%]
%BatteryCapacity     = 1000*BatteryCapacity/BatteryVNom; % [Ah]
%[param1_grid, param2_grid] = ndgrid(SolarPanels, BatteryCapacity);


%EMS Test 1:
%EMSElecStartHr  = 15;  %[h] Electrolyser starts before this hour (was 12)
%EMSElecStartSoC = 70; 
%EMSElecStopSoC = EMSElecStartSoC-[5 10 15 20 25];
%[param1_grid, param2_grid] = ndgrid(EMSElecStartSoC, EMSElecStopSoC);


%EMS Test 2:
%EMSFCStartSoC = 15:5:25;
%MinSoCGrid    = EMSFCStartSoC-5;
%EMSFCStopSoC = 90;
%EMSFCSoCThresholds = [20, 30, 40, 50, 60];
%[param1_grid, param2_grid] = ndgrid(EMSFCStartSoC, EMSFCStopSoC);


% Improved test 1:
SolarPanels         = 12;
BatteryCapacity     = 2*15.36;    % [kWh]
BatteryVNom         = 51.2;     % [V]
BatteryInitialSoC   = 50;       % [%]
BatteryCapacity     = 1000*BatteryCapacity/BatteryVNom; % [Ah]
[param1_grid, param2_grid] = ndgrid(SolarPanels, BatteryCapacity);


%%

param_combinations = [param1_grid(:), param2_grid(:)];
results = struct();
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
    

    %assignin('base', 'EMSElecStartSoC', param1);
    %assignin('base', 'EMSElecStopSoC', param1-15);
    %assignin('base', 'EMSElecStartHr', param2);
    %assignin('base', 'EMSElecStopSoC', param2);

    %assignin('base', 'EMSFCStartSoC', param1);
    %assignin('base', 'MinSoCGrid', param1-5);
    %assignin('base', 'EMSFCStopSoC', param2);
    
    %simOut = sim('EnergyHub_V5_inf_buffer.slx');
    simOut = sim('EnergyHub_V5.slx');
    %simOut = sim('EnergyHub_V5_impr.slx');
    
    results.param1 =             param1;
    results.param2 =             param2;
    results.efficiency =         simOut.efficiency;
    results.PV_Demand =          simOut.PV_Demand;
    results.PowerComponents =    simOut.PowerComponents;
    results.StateOfCharge =      simOut.StateOfCharge;
    results.Grid =               simOut.Grid;
    results.Time =               simOut.Time;
    results.Hydrogen =           simOut.Hydrogen;

    fprintf('Simulation %d/%d completed at %s: param1=%.2f, param2=%.2f\n', ...
            i, num_simulations, datestr(now, 'HH:MM:SS'), param1, param2);
    
    simtime = now-begin;

    fprintf('Simulation %d/%d lasted %s ', ...
            i, num_simulations, datestr(simtime, 'HH:MM:SS'));
    %filename = sprintf('EMS_FCTest_%d_StartSoC_%d_StopSoC.mat', param1, param2);
    %filename = sprintf('InfHydrogen%d_Panels_%d_Ah.mat', param1, param2);
    filename = sprintf('NoHydrogenIntegration%d_Panels_%d_Ah.mat', param1, param2);
    %filename = sprintf('EMS_Test_%d_StartSoC_%d_StartHr.mat', param1, param2);
    %filename = sprintf('EMS_Test_%d_StartSoC_%d_StopSoC.mat', param1, param2);
    %filename = sprintf('IMPR_V4_EnergyHub_%d_PVPanels_%d_Ah_Battery.mat', param1, param2);
    save(filename, 'results', '-v7.3')

end


%% Results

TitleSize = 18;
FontSize = 14;
cmap = parula(10);

% From this point, the results are visualised and calculated
% First the results are loaded

%test = 1;
%panels = 21;    % 12, 15,  18,  21
%battery = 600;  % 150, 300, 600

%EMSElecStartSoC = 80; % 60, 70, 80
%EMSElecStopSoC = EMSElecStartSoC-15;
%EMSElecStartHr = 15; % 12, 13, 14, 15

EMSFCStartSoC = 15;  % 15, 20, 25
MinSoCGrid    = EMSFCStartSoC-5;
EMSFCStopSoC  = 70;   % 70, 80, 90

%name = sprintf('InfHydrogen%d_Panels_%d_Ah.mat', panels, battery);
%name = sprintf('NoHydrogenIntegration%d_Panels_%d_Ah.mat', panels, battery);
%name = sprintf('TGV_EnergyHub_%d_PVPanels_%d_Ah_Battery.mat', panels, battery);
%name = sprintf('IMPR_EnergyHub_%d_PVPanels_%d_Ah_Battery.mat', panels, battery);
%name = sprintf('EMS_Test_%d_StartSoC_%d_StartHr.mat', EMSElecStartSoC, EMSElecStartHr);
name = sprintf('EMS_FCTest_%d_StartSoC_%d_StopSoC.mat', EMSFCStartSoC, EMSFCStopSoC);

load(name)


%% Plotting Hydrogen Bufffer

%foldername = sprintf('Output/TGV_Test_%d_%d', panels, battery);
%foldername = sprintf('Output/InfHydrogen_Test_%d_%d', panels, battery);
%foldername = sprintf('Output/IMPR_V1_Test_%d_%d', panels, battery);
%foldername = sprintf('Output/NoHydrogen_Test_%d_%d', panels, battery);
%foldername = sprintf('Output/EMS_Test_Elec_%d_%d', EMSElecStartSoC, EMSElecStartHr);
foldername = sprintf('Output/EMS_FCTest_%d_%d', EMSFCStartSoC, EMSFCStopSoC);

if ~exist(foldername, 'dir')
    mkdir(foldername);
end

data = results.StateOfCharge.Data(:,1);
time = results.StateOfCharge.time;

minlim = min(data)-0.1*max(data);
maxlim = 1.15*max(data);

figure('Position', [100 100 900 600]);
plot(time, data, LineWidth=3, color = 'cyan')
yline(HydrogenCapacity, 'color' ,[0.3 0.3 0.3], 'LineStyle', '--', LineWidth= 2);
ax = gca;
grid on
title('Hydrogen Buffer State of Charge From System', 'FontSize',TitleSize)
ylabel('Hydrogen State of Charge [kg]', FontSize=FontSize)
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
legend('Hydrogen in the buffer','maximum amount of hydrogen','Location', 'northeast', 'FontSize', FontSize);


filename = sprintf('%d_%d_%s', panels, battery, "HyBuffer");
ax.Toolbar = [];
saveas(gcf, fullfile(foldername, [filename '.png']));


%% Plotting State Of Charge

data = [results.StateOfCharge.Data(:,3)];
data2 = [results.StateOfCharge.Data(:,2)];

time = results.StateOfCharge.time;

minlim = 0;min(data)-0.1*max(data);
maxlim = 110;1.1*max(data);

figure('Position', [100 100 900 600]);
plot(time, data(:,1), LineWidth=3)

hold on
plot(time, data2, color = 'cyan',LineWidth=3)

yline(MinSoCGrid, 'color' ,'r', 'LineStyle', '--', LineWidth= 2);
yline(EMSFCStartSoC, 'color' ,cmap(8,:), 'LineStyle', '--', LineWidth= 2);
yline(EMSFCStopSoC, 'color' ,'g', 'LineStyle', '--', LineWidth= 2);

ax = gca;
grid on
title('System State of Charge', 'FontSize',TitleSize)
ylabel('State of Charge [%]', FontSize=FontSize)
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
legend('Battery state of charge [%]','Hydrogen buffer state of charge [%]','Minimum SoC','Fuel cell turns on SoC','Fuel cell turns off SoC','Location', 'northeast', 'FontSize', FontSize);

filename = sprintf('%d_%d_%s', panels, battery, "SoCs");
ax.Toolbar = [];
saveas(gcf, fullfile(foldername, [filename '.png']));


%% Plotting hydrogen consumption and production

data = [results.Hydrogen.Data(:,4)/1000   results.Hydrogen.Data(:,2)/1000];
time = results.Hydrogen.time;
clr = {'blue' 'red'};
minlim = 0;min(data)-0.1*max(data);
maxlim = 1.1*max(max(data(:,1),max(data(:,2))));60;

figure('Position', [100 100 900 600]);
plot(time, data(:, 1),LineWidth=3, Color=clr{1});
hold on;

% Plot second data stream (Hydrogen data column 2) in blue
plot(time, data(:, 2), LineWidth=3,Color=clr{2});
%yline(48, 'color' ,[0.3 0.3 0.3], 'LineStyle', '--', LineWidth= 2);
ax = gca;
grid on

yline(max(data(:,1)), 'color' ,clr{1}, 'LineStyle', '--', LineWidth= 2);
yline(max(data(:,2)), 'color' ,clr{2}, 'LineStyle', '--', LineWidth= 2);
text(3600*24*280, 0.95*max(data(:,1)), ['Total kg: ', num2str(max(data(:,1)))], Color=clr{1}, HorizontalAlignment= 'center', VerticalAlignment ='bottom');
text(3600*24*280, 1.05*max(data(:,2)), ['Total kg: ', num2str(max(data(:,2)))], Color=clr{2}, HorizontalAlignment= 'center', VerticalAlignment ='bottom');

title('Hydrogen Consumption and Production From Current System', 'FontSize',TitleSize)
ylabel('Hydrogen [kg]', FontSize=FontSize)
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
legend('Hydrogen consumption','Hydrogen production','Location', 'northwest', 'FontSize', FontSize);

fprintf("Hydrogen produced in kWh: %.2f\n", max( results.Hydrogen.Data(:,1) ) )
fprintf("Hydrogen produced in kg:  %.2f\n", max((results.Hydrogen.Data(:,2))/1000))
fprintf("Hydrogen used in kWh:  %.2f\n", max(results.Hydrogen.Data(:,3)))
fprintf("Hydrogen used in kg:  %.2f\n", max(results.Hydrogen.Data(:,4))/1000)

filename = sprintf('%d_%d_%s', panels, battery, "HyProdCons");
ax.Toolbar = [];
saveas(gcf, fullfile(foldername, [filename '.png']));


%% Plotting Grid Power Exchange

TitleSize = 18;
FontSize = 14;

data = [results.Grid.Data(:,1)   results.Grid.Data(:,2)];
time = results.Grid.time;
clr = {'red' 'blue'};
minlim = 0;min(data)-0.1*max(data);
maxlim = 1.1*max(data(:, 2));

figure('Position', [100 100 900 600]);
plot(time, data(:, 1),LineWidth=3, Color=clr{1});
hold on;

% Plot second data stream (Hydrogen data column 2) in blue
plot(time, data(:, 2), LineWidth=3,Color=clr{2});
%yline(48, 'color' ,[0.3 0.3 0.3], 'LineStyle', '--', LineWidth= 2);
ax = gca;
grid on
title('Grid Power Exchange During Full Year', 'FontSize',TitleSize)
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
legend('Power taken from grid','Power delivered to grid','Location', 'northwest', 'FontSize', FontSize);

filename = sprintf('%d_%d_%s', panels, battery, "GridPower");
ax.Toolbar = [];
saveas(gcf, fullfile(foldername, [filename '.png']));


%% Plotting Grid Energy Exchange

data = [results.Grid.Data(:,4)   results.Grid.Data(:,3)];
time = results.Grid.time;
clr = {'red' 'blue'};
minlim = 0;min(data)-0.1*max(data);
maxlim = 1.1*max(max(data(:, 1)), max(data(:, 2)));

figure('Position', [100 100 900 600]);
plot(time, data(:, 1),LineWidth=3, Color=clr{1});
hold on;

% Plot second data stream (Hydrogen data column 2) in blue
plot(time, data(:, 2), LineWidth=3,Color=clr{2});
yline(max(data(:,1)), 'color' ,'r', 'LineStyle', '--', LineWidth= 2);
yline(max(data(:,2)), 'color' ,'b', 'LineStyle', '--', LineWidth= 2);
text(3600*24*300, 1.05*max(data(:,1)), ['Total: ', num2str(max(data(:,1)))], Color=clr{1}, HorizontalAlignment= 'center', VerticalAlignment ='bottom');
text(3600*24*300, 1.05*max(data(:,2)), ['Total: ', num2str(max(data(:,2)))], Color=clr{2}, HorizontalAlignment= 'center', VerticalAlignment ='bottom');

ax = gca;
grid on
title('Grid Energy Exchange During Full Year', 'FontSize',TitleSize)
ylabel('Energy [kWh]', FontSize=FontSize)
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
legend('Energy taken from grid','Energy delivered to grid','Location', 'northwest', 'FontSize', FontSize);

fprintf("Grid energy delivered in kWh: %.2f\n", max(results.Grid.Data(:,3)))
fprintf("Grid energy pulled in kWh: %.2f\n", max(results.Grid.Data(:,4)))

filename = sprintf('%d_%d_%s', panels, battery, "GridEnergy");
ax.Toolbar = [];
saveas(gcf, fullfile(foldername, [filename '.png']));


%% PowerComponents

data = [results.PowerComponents.Data(:,1) results.PowerComponents.Data(:,2) results.PowerComponents.Data(:,3)];
time = results.PowerComponents.time;
clr = {'blue' 'green' 'red'};
minlim = min(data(:,2))-0.1*max(data(:,2));
maxlim = 1.1*max(data(:,2));

figure('Position', [100 100 900 600]);
plot(time, data(:, 1),LineWidth=3, Color=clr{1});
hold on;
plot(time, data(:, 2), LineWidth=3,Color=clr{3});
plot(time, data(:, 3), LineWidth=3,Color=clr{2});

%yline(max(results.Grid.Data(:,3)), 'color' ,'b', 'LineStyle', '--', LineWidth= 2);
%yline(max(results.Grid.Data(:,4)), 'color' ,'r', 'LineStyle', '--', LineWidth= 2);

ax = gca;
grid on
title('Electrolyser, Compressor, and Fuel Cell Power', 'FontSize',TitleSize)
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
legend('Fuel cell power generation','Electrolyser power consumption','Compressor power consumption','Location', 'northwest', 'FontSize', FontSize);

filename = sprintf('%d_%d_%s', panels, battery, "PowerComponents");
ax.Toolbar = [];
saveas(gcf, fullfile(foldername, [filename '.png']));


%% Plotting Partly State Of Charge

data = [results.StateOfCharge.Data(:,3) results.StateOfCharge.Data(:,2)];
time = results.StateOfCharge.time;

% Define time limits for one month
total_time = max(time);  % Total simulation time (assumed to be 1 year)
month_duration = total_time / 12;  % Each month spans 1/12 of the total time

% Select a specific month (e.g., month 3 -> March)
month_num = 1; % Change this to choose another month
t_start = (month_num - 1) * month_duration; % Start time of the month
t_end = month_num * month_duration; % End time of the month

% Find indices where time falls within the selected month
indices = (time >= t_start) & (time < t_end);

% Trim data
trimmed_time = time(indices);
trimmed_data = data(indices,:);

minlim = 0;min(data)-0.1*max(data);
maxlim = 110;1.1*max(data);

figure('Position', [100 100 900 600]);
plot(trimmed_time, trimmed_data(:,1), LineWidth=3)

hold on
plot(trimmed_time, trimmed_data(:,2), color = 'c',LineWidth=3)
yline(20, 'color' ,'r', 'LineStyle', '--', LineWidth= 2);
yline(25, 'color' ,cmap(8,:), 'LineStyle', '--', LineWidth= 2);
yline(90, 'color' ,'g', 'LineStyle', '--', LineWidth= 2);

ax = gca;
grid on
title('Battery and Hydrogen Buffer State of Charge 1st month', 'FontSize',TitleSize)
ylabel('State of Charge [%]', FontSize=FontSize)
xlabel('Time',FontSize=FontSize)

xlim([min(trimmed_time) max(trimmed_time)])
ylim([minlim maxlim])

num_days = 31; % Get days for the selected month
month_duration = total_time / 12;  % Each month spans 1/12 of the total time

% Define x-axis ticks for days
xtick_positions = linspace(min(trimmed_time), max(trimmed_time), num_days);
xtick_labels = 1:num_days; % Day numbers (1, 2, ..., 31)


ax.XAxis.FontSize = FontSize; 
ax.YAxis.FontSize = FontSize;

xticks(xtick_positions);
xticklabels(string(xtick_labels)); % Convert day numbers to string labels

legend('Battery state of charge [%]','Hydrogen buffer state of charge [%]','Minimum SoC','Fuel cell turns on SoC','Fuel cell turns off SoC','Location', 'northeast', 'FontSize', FontSize);

filename = sprintf('%d_%d_%s', panels, battery, "FirstMonthSoCs");
ax.Toolbar = [];
saveas(gcf, fullfile(foldername, [filename '.png']));


%% Efficiencies

data = [results.efficiency.Data(:,1) results.efficiency.Data(:,2)];
time = results.efficiency.time;
clr = {'blue' 'red'};
minlim = 0;min(data(:,2))-0.1*max(data(:,2));
maxlim = 100;1.1*max(data(:,2));

figure('Position', [100 100 900 600]);
plot(time, data(:, 1),LineWidth=3, Color=clr{1});
hold on;
plot(time, data(:, 2), LineWidth=3,Color=clr{2});

yline(nanmean(data(:,1)), Color=clr{1}, LineStyle ='--', LineWidth= 2);
yline(nanmean(data(:,2)), Color=clr{2}, LineStyle ='--', LineWidth= 2);

text(3600*24*180, 1.05*nanmean(data(:,1)), ['Avg: ', num2str(nanmean(data(:,1)))], Color=clr{1}, HorizontalAlignment= 'center', VerticalAlignment ='bottom');
text(3600*24*180, 1.05*nanmean(data(:,2)), ['Avg: ', num2str(nanmean(data(:,2)))], Color=clr{2}, HorizontalAlignment= 'center', VerticalAlignment ='bottom');

ax = gca;
grid on
title('Electrolyser and Fuel Cell Efficiency', 'FontSize',TitleSize)
ylabel('Efficiency [%]', FontSize=FontSize)
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
legend('Electrolyser efficiency','Fuel cell efficiency','Location', 'northwest', 'FontSize', FontSize);


fprintf("Electrolyser efficiency: %.2f\n", nanmean(data(:,1)))
fprintf("Fuel cell efficiency: %.2f\n", nanmean(data(:,2)))

filename = sprintf('%d_%d_%s', panels, battery, "Efficiencies");
ax.Toolbar = [];
saveas(gcf, fullfile(foldername, [filename '.png']));


%% Mismatch

data = [results.PV_Demand.Data(:,2) results.PV_Demand.Data(:,4)];
data2 = data(:,1)-data(:,2);
time = results.PV_Demand.time;
clr = {cmap(9,:) 'red' cmap(4,:)};
minlim = min(min(data))-0.1*max(max(data));
maxlim = 1.1*max(max(data));

figure('Position', [100 100 900 600]);
plot(time, data(:, 1),LineWidth=3, Color=clr{1});
hold on;
plot(time, data(:, 2), LineWidth=3,Color=clr{2});
plot(time, data2, LineWidth=3,Color=clr{3});


ax = gca;
grid on
title('Energy Mismatch - Demand vs. PV', 'FontSize',TitleSize)
ylabel('Energy [kWh]', FontSize=FontSize)
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
legend('PV energy generated','Demand Energy' , 'Mismatch','Location', 'northwest', 'FontSize', FontSize);


fprintf("PV energy generated: %.2f\n", max(results.PV_Demand.Data(:,2)))
fprintf("Demand energy: %.2f\n", max(results.PV_Demand.Data(:,4)))
fprintf("Mismatch energy: %.2f\n", max(data2)-min(data2))
fprintf("Hydrogen Left in Buffer: %.2f\n", results.Hydrogen.Data(1, end))

filename = sprintf('%d_%d_%s', panels, battery, "Mismatch");
ax.Toolbar = [];
saveas(gcf, fullfile(foldername, [filename '.png']));


%% PV - Electrolyser

data = [results.PV_Demand.Data(:,1)];
data2 = results.PowerComponents.Data(:,2);

time = results.PV_Demand.time;
time2 = results.PowerComponents.time;

clr = {cmap(9,:) 'red' cmap(4,:)};
minlim = min(min(data))-0.1*max(max(data));
maxlim = 1.1*max(max(data));

figure('Position', [100 100 900 600]);
plot(time, data(:, 1),LineWidth=3, Color=clr{1});
hold on;
plot(time2, data2, LineWidth=3,Color=clr{2});

ax = gca;
grid on
title('PV Power vs. Electrolyser Power', 'FontSize',TitleSize)
ylabel('Energy [kWh]', FontSize=FontSize)
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
legend('PV power','Electrolyser power' , 'Location', 'northwest', 'FontSize', FontSize);


fprintf("PV energy generated: %.2f\n", max(results.PV_Demand.Data(:,2)))
fprintf("Demand energy: %.2f\n", max(results.PV_Demand.Data(:,4)))
fprintf("Mismatch energy: %.2f\n", max(data2)-min(data2))
fprintf("Hydrogen Left in Buffer: %.2f\n", results.Hydrogen.Data(1, end))

filename = sprintf('%d_%d_%s', panels, battery, "PVElectrolyser");
ax.Toolbar = [];
saveas(gcf, fullfile(foldername, [filename '.png']));


%% Print all values for table
clc;

fprintf("PV energy generated: %.2f\n", max(results.PV_Demand.Data(:,2)))
fprintf("Demand energy: %.2f\n\n", max(results.PV_Demand.Data(:,4)))

fprintf("Electrolyser efficiency: %.2f\n", nanmean(results.efficiency.Data(:,1)))
fprintf("Fuel cell efficiency: %.2f\n\n", nanmean(results.efficiency.Data(:,2)))

fprintf("Hydrogen used in kWh:  %.2f\n", max(results.Hydrogen.Data(:,3)))
fprintf("Hydrogen used in kg:  %.2f\n", max(results.Hydrogen.Data(:,4))/1000)
fprintf("Hydrogen produced in kWh: %.2f\n", max(results.Hydrogen.Data(:,1) ) )
fprintf("Hydrogen produced in kg:  %.2f\n\n", max((results.Hydrogen.Data(:,2))/1000))

fprintf("Grid energy delivered in kWh: %.2f\n", max(results.Grid.Data(:,3)))
fprintf("Grid energy pulled in kWh: %.2f\n\n", max(results.Grid.Data(:,4)))

%fprintf("Hydrogen Left in Buffer: %.2f\n", results.Hydrogen.Data(:, end))
