%% Component profiles:


%% Plotting electrolyser profile(s)

data2 = results(test).Hydrogen.Data(:,5);
data1 = results(test).PowerComponents.Data(:,2);
time2 = results(test).Hydrogen.time;
time1 = results(test).PowerComponents.time;


clr = {'red' 'cyan'};
minlim = 0;min(data)-0.1*max(data);
maxlim = 2500;1.1*max(data);

figure('Position', [100 100 900 600]);
plot(time1, data1,LineWidth=3, Color=clr{1});
hold on;

plot(time2, data2, LineWidth=3,Color=clr{2});
%yline(48, 'color' ,[0.3 0.3 0.3], 'LineStyle', '--', LineWidth= 2);
ax = gca;
grid on
title('Electrolyser Power Consumption and Hydrogen Production', 'FontSize',TitleSize)
ylabel('Hydrogen [kg]', FontSize=FontSize)
xlabel('Time',FontSize=FontSize)

bound1 = 177*24*60*60;
bound2 = 178*24*60*60;

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
