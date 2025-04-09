%EMS Calculations

%% Load Data


name = sprintf('simulation_results_TGV_V5001');
load(name)

cmap = parula(10);
test = 1;

PVenergy = results(test).PV_Demand.Data(:,2);
Demandenergy = results(test).PV_Demand.Data(:,4);

time = results(test).PV_Demand.time;
Netenergy = PVenergy - Demandenergy; % Net energy per 10 min in kWh



% Define time limits for one day
total_time = max(time);  % Total simulation time (assumed to be 1 year)
day_duration = total_time / 365;  % Each month spans 1/12 of the total time

day_num = 10; 
t_start = (day_num - 1) * day_duration; %Start time of the day
t_end = day_num * day_duration; % End time of the day

% Find indices where time falls within the selected month
indices = (time >= t_start) & (time < t_end);



% Trim data
trim_time = time(indices);
PVenergy = PVenergy(indices,:)-PVenergy(1,:);
PVenergy = PVenergy-PVenergy(1,:);

Demandenergy = Demandenergy(indices,:);
Demandenergy = Demandenergy-Demandenergy(1,:);
Netenergy = PVenergy - Demandenergy;

additional_power = 0.08 * ones(size(trim_time)); % Constant 80 W over time
additional_energy = cumtrapz(trim_time, additional_power) / 3600; % Convert Ws to kWh

Demandenergy = Demandenergy + additional_energy;

morning_start = Demandenergy(find(trim_time >= 0+t_start, 1, 'first'));       % 00:00
morning_end = Demandenergy(find(trim_time >= 7*3600+t_start, 1, 'first'));    % 07:00
evening_start = Demandenergy(find(trim_time >= 19*3600+t_start, 1, 'first')); % 19:00
evening_end = Demandenergy(find(trim_time >= 24*3599+t_start, 1, 'first'));   % 24:00

% Calculate demanded energy for each period
demand_morning = morning_end - morning_start;
demand_evening = evening_end - evening_start;
total_demand = demand_morning + demand_evening;


Battery_Capacity = 15.36;
minSoC = 25; %



Needed_SoC = (total_demand/Battery_Capacity)*100+minSoC;

fprintf("Demanded energy from 00:00 - 07:00: %.2f kWh\n", demand_morning);
fprintf("Demanded energy from 19:00 - 24:00: %.2f kWh\n", demand_evening);
fprintf("Total demanded energy (00:00-07:00 & 19:00-24:00): %.2f kWh\n", total_demand);
fprintf("Needed SoC for the remainder of the night: %.2f \n", Needed_SoC);

clr = {cmap(9,:) 'red' cmap(4,:)};

minlim = min(Netenergy);
maxlim = 1.1*max(max(max(PVenergy),max(Demandenergy)));

figure('Position', [100 100 900 600]);
plot(trim_time, PVenergy,LineWidth=3, Color=clr{1});
hold on;
plot(trim_time, Demandenergy, LineWidth=3,Color=clr{2});
plot(trim_time, Netenergy, LineWidth=3,Color=clr{3});


ax = gca;
grid on
title('Energy Mismatch - Demand vs. PV', 'FontSize',TitleSize)
ylabel('Energy [kWh]', FontSize=FontSize)
xlabel('Time',FontSize=FontSize)

xlim([min(trim_time) max(trim_time)])
ylim([minlim maxlim])

xtick_positions = linspace(min(trim_time), max(trim_time), 24 + 1); % 12 intervals
day_labels = {'00:00', '01:00', '02:00', '03:00', '04:00','05:00', '06:00', '07:00', '08:00', '09:00', ...
  '10:00', '11:00', '12:00', '13:00', '14:00','15:00', '16:00', '17:00', '18:00', '19:00',  ...
  '20:00', '21:00', '22:00', '23:00', '00:00'};
ax.XAxis.FontSize = FontSize; 
ax.YAxis.FontSize = FontSize;
xticks(xtick_positions);
xticklabels(day_labels);
legend('PV energy generated','Demand Energy' , 'Mismatch','Location', 'northwest', 'FontSize', FontSize);


fprintf("PV energy generated: %.2f\n", max(PVenergy))
fprintf("Demand energy: %.2f\n", max(Demandenergy))
fprintf("Mismatch energy: %.2f\n", max(Netenergy))

