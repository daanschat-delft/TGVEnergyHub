%% Component profiles:

TitleSize = 20;
LabelSize = 14;
AxisSize = 12;
LegendSize = 12;

%% Plotting electrolyser profile(s)


modelname = "TGV_EnergyHub_21_PVPanels_300_Ah_Battery.mat";
modeldata = load(modelname);
data2 = modeldata.results.Hydrogen.Data(:,5);
data1 = modeldata.results.PowerComponents.Data(:,2);
time2 = modeldata.results.Hydrogen.time;
time1 = modeldata.results.PowerComponents.time;


clr = {'red' 'cyan'};
minlim = 0;
maxlim = 2500;

figure('Position', [100 100 900 600]);
plot(time1, data1,LineWidth=3, Color=clr{1});
hold on;

plot(time2, data2, LineWidth=3,Color=clr{2});
%yline(48, 'color' ,[0.3 0.3 0.3], 'LineStyle', '--', LineWidth= 2);
ax = gca;
grid on
title('Electrolyser Power Consumption and Hydrogen Production', 'FontSize',TitleSize)
ylabel('Hydrogen [kg]', FontSize=LabelSize)
xlabel('Time',FontSize=LabelSize)

bound1 = 126*24*60*60;
bound2 = 187*24*60*60;

xlim([bound1 bound2])
ylim([minlim maxlim])
xtick_positions = linspace(bound1, bound2, 12 + 1); % 12 intervals
month_labels = {'00:00', '02:00', '04:00', '06:00', '08:00', '10:00', ...
                '12:00', '14:00', '16:00', '18:00', '20:00', '22:00'};
ax.XAxis.FontSize = AxisSize; 
ax.YAxis.FontSize = AxisSize;
xticks(xtick_positions);
xticklabels(month_labels);
legend('Electrolyser power consumption [W]','Hydrogen production [NL/h]','Location', 'northwest', 'FontSize', LegendSize);


%% Plotting electrolyser profile(s)

data1 = results(test).PowerComponents.Data(:,2);
time1 = results(test).PowerComponents.time;

data2 = results(test).Hydrogen.Data(:,5);
time2 = results(test).Hydrogen.time;

data3 = results(test).StateOfCharge.Data(:,3);
time3 = results(test).StateOfCharge.time;

data4 = results(test).PV_Demand.Data(:,1);
time4 = results(test).PV_Demand.time;

clr = {'red' 'cyan'};
minlim = 0;min(data1)-0.1*max(data1);
maxlim = 2500;1.1*max(data1);

figure('Position', [100 100 900 600]);
plot(time1, data1,LineWidth=3, Color=clr{1});
hold on;

plot(time2, data2, LineWidth=3,Color=clr{2});
%plot(time3, data3*10, LineWidth=3,Color='b');
%plot(time4, data4, LineWidth=3,Color='g');

%yline(48, 'color' ,[0.3 0.3 0.3], 'LineStyle', '--', LineWidth= 2);
ax = gca;
grid on
title('Electrolyser Power Consumption and Hydrogen Production', 'FontSize',TitleSize)
ylabel('Electrolyser power and flow [W] / [NL/h]', FontSize=FontSize)
xlabel('Time',FontSize=FontSize)

bound1 = 222*24*60*60;178*24*60*60;
bound2 = 223*24*60*60;179*24*60*60;

xlim([bound1 bound2])
ylim([minlim maxlim])
xtick_positions = linspace(bound1, bound2, 12 + 1); % 12 intervals
month_labels = {'00:00', '02:00', '04:00', '06:00', '08:00', '10:00', ...
                '12:00', '14:00', '16:00', '18:00', '20:00', '22:00'};
ax.XAxis.FontSize = FontSize; 
ax.YAxis.FontSize = FontSize;
xticks(xtick_positions);
xticklabels(month_labels);
legend('Electrolyser power consumption [W]','Hydrogen production [NL/h]','Location', 'northwest', 'FontSize', FontSize);

%% Plotting compressor profile(s)

data1 = results(test).PowerComponents.Data(:,3);
time1 = results(test).PowerComponents.time;

data2 = results(test).Hydrogen.Data(:,5);
time2 = results(test).Hydrogen.time;

data3 = results(test).StateOfCharge.Data(:,3);
time3 = results(test).StateOfCharge.time;

data4 = results(test).PV_Demand.Data(:,1);
time4 = results(test).PV_Demand.time;

clr = {'red' 'cyan'};
minlim = 0;min(data1)-0.1*max(data1);
maxlim = 1.1*max(data1);

figure('Position', [100 100 900 600]);
plot(time1, data1,LineWidth=3, Color=clr{1});
hold on;

%plot(time2, data2, LineWidth=3,Color=clr{2});
%plot(time3, data3*10, LineWidth=3,Color='b');
%plot(time4, data4, LineWidth=3,Color='g');

%yline(48, 'color' ,[0.3 0.3 0.3], 'LineStyle', '--', LineWidth= 2);
ax = gca;
grid on
title('Compressor Power Consumption', 'FontSize',TitleSize)
ylabel('Compressor Power [W]', FontSize=FontSize)
xlabel('Time',FontSize=FontSize)

bound1 = 131*24*60*60;178*24*60*60;
bound2 = 132*24*60*60;179*24*60*60;

xlim([bound1 bound2])
ylim([minlim maxlim])
xtick_positions = linspace(bound1, bound2, 12 + 1); % 12 intervals
month_labels = {'00:00', '02:00', '04:00', '06:00', '08:00', '10:00', ...
                '12:00', '14:00', '16:00', '18:00', '20:00', '22:00'};
ax.XAxis.FontSize = FontSize; 
ax.YAxis.FontSize = FontSize;
xticks(xtick_positions);
xticklabels(month_labels);
legend('Compressor power consumption [W]','Location', 'northwest', 'FontSize', FontSize);


%% Plotting fuel cell profile(s)

data1 = results(test).PowerComponents.Data(:,1);
time1 = results(test).PowerComponents.time;

data2 = results(test).Hydrogen.Data(:,5);
time2 = results(test).Hydrogen.time;

data3 = results(test).StateOfCharge.Data(:,3);
time3 = results(test).StateOfCharge.time;

data4 = results(test).PV_Demand.Data(:,1);
time4 = results(test).PV_Demand.time;

clr = {'blue' 'cyan'};
minlim = 0;min(data1)-0.1*max(data1);
maxlim = 1.1*max(data1);

figure('Position', [100 100 900 600]);
plot(time1, data1,LineWidth=3, Color=clr{1});
hold on;

%plot(time2, data2, LineWidth=3,Color=clr{2});
%plot(time3, data3*10, LineWidth=3,Color='b');
%plot(time4, data4, LineWidth=3,Color='g');

%yline(48, 'color' ,[0.3 0.3 0.3], 'LineStyle', '--', LineWidth= 2);
ax = gca;
grid on
title('Fuel Cell Power Generation', 'FontSize',TitleSize)
ylabel('Fuel Cell Power [W]', FontSize=FontSize)
xlabel('Time',FontSize=FontSize)

bound1 = 15*24*60*60;178*24*60*60;
bound2 = 16*24*60*60;179*24*60*60;

xlim([bound1 bound2])
ylim([minlim maxlim])
xtick_positions = linspace(bound1, bound2, 12 + 1); % 12 intervals
month_labels = {'00:00', '02:00', '04:00', '06:00', '08:00', '10:00', ...
                '12:00', '14:00', '16:00', '18:00', '20:00', '22:00'};
ax.XAxis.FontSize = FontSize; 
ax.YAxis.FontSize = FontSize;
xticks(xtick_positions);
xticklabels(month_labels);
legend('Fuel cell power generation [W]','Location', 'northwest', 'FontSize', FontSize);




%% --- Data part:

opts1 = detectImportOptions('SSS-Electrolyser-Active-Power.csv');
Eldata1 = readtable('SSS-Electrolyser-Active-Power.csv', opts1);

% Convert time to datetime
ElectrolyserTime = datetime(Eldata1.time, ...
    'InputFormat', 'yyyy-MM-dd''T''HH:mm:ss''Z''', ...
    'TimeZone', 'UTC');

% Convert last column to numeric
powerNum = zeros(height(Eldata1), 1);
for i = 1:height(Eldata1)
    if isempty(Eldata1.last{i})
        powerNum(i) = 0;
    else
        powerNum(i) = str2double(Eldata1.last{i});
    end
end

% Create clean power table
ElectrolyserPowerTable = table(ElectrolyserTime, powerNum, 'VariableNames', {'time', 'power'});

Eldata2 = readtable('HydrogenFlowRate.xlsx');

% Convert time column to datetime
HydrogenTime = datetime(Eldata2.time, ...
    'InputFormat', 'yyyy-MM-dd''T''HH:mm:ss''Z''', ...
    'TimeZone', 'UTC');

% Make sure last column is numeric
HydrogenFlow = double(Eldata2.last);

% Create clean hydrogen table
HydrogenFlowTable = table(HydrogenTime, HydrogenFlow, 'VariableNames', {'time', 'hydrogen'});

Electrolyser = outerjoin(ElectrolyserPowerTable, HydrogenFlowTable, ...
    'Keys', 'time', 'MergeKeys', true, 'Type', 'left');

% Fill missing values with zero
Electrolyser.power(isnan(Electrolyser.power)) = 0;
Electrolyser.hydrogen(isnan(Electrolyser.hydrogen)) = 0;

start_date = datetime('2024-08-06 00:00:00', 'TimeZone', 'UTC');
end_date   = datetime('2024-08-06 23:59:59', 'TimeZone', 'UTC');

% Filter each table
idxP = (ElectrolyserPowerTable.time >= start_date) & (ElectrolyserPowerTable.time <= end_date);
PowerFiltered = ElectrolyserPowerTable(idxP,:);

idxH = (HydrogenFlowTable.time >= start_date) & (HydrogenFlowTable.time <= end_date);
HydrogenFiltered = HydrogenFlowTable(idxH,:);

figure('Position', [100 100 800 500]);
hold on;
plot(PowerFiltered.time, PowerFiltered.power, '-r', 'LineWidth', 2, 'DisplayName', 'Electrolyser power consumption [W]');
plot(HydrogenFiltered.time, HydrogenFiltered.hydrogen, '-c', 'LineWidth', 2, 'DisplayName', 'Hydrogen production [NL/h]');
xlabel('Time', 'FontSize', 14);
ylabel('Power and Hydrogen Flow [W] / [NL/h]', 'FontSize', 14);
title('Electrolyser Power Consumption and Hydrogen Production', 'FontSize', 16);
legend('Location', 'northwest', 'FontSize', 12);
grid on;
ax = gca;
ax.XTickLabelRotation = 45;
ax.FontSize = 12;
hold off;