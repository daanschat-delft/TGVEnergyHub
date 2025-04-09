%% Results of the sizing tests


TitleSize = 18;
FontSize = 14;
cmap = parula(10);
foldername = 'Output/3D_Out';

panels = [12, 15, 18, 21];      % 12, 15,  18,  21
battery = [150, 300, 600];      % 150, 300, 600
[param1_grid, param2_grid] = ndgrid(panels, battery);


param_combinations = [param1_grid(:), param2_grid(:)];
results = struct();
tests = size(param_combinations, 1);

for i = 1:tests
    loadpanels  = param_combinations(i, 1);
    loadbattery = param_combinations(i, 2);

    name = sprintf('TGV_EnergyHub_%d_PVPanels_%d_Ah_Battery.mat', loadpanels, loadbattery);
    load(name)

    grid_delivered(i) = max(results.Grid.Data(:,3));
    grid_pulled(i) = max(results.Grid.Data(:,4));

    HyProd(i) = max((results.Hydrogen.Data(:,2))/1000);
    HyCons(i) = max(results.Hydrogen.Data(:,4))/1000;

end


Z = reshape(grid_pulled, size(param1_grid));

figure;
surf(panels, battery, Z');
xlabel('Number of Panels');
ylabel('Battery Capacity [kWh]');
zlabel('Grid Energy [kWh]');
title('Pulled energy from the grid vs. battery capacity and solar panels');

colormap(parula);          % Vibrant colormap
colorbar;                 % Show color scale
camlight headlight;       % Add lighting
lighting gouraud;         % Soft lighting model
view(135, 30);            % Set a good viewing angle

filename = '3D_Sizing_GridPulled.png';
ax.Toolbar = [];
saveas(gcf, fullfile(foldername, filename));



% Grid delivered
Z = reshape(grid_delivered, size(param1_grid));

figure;
surf(panels, battery, Z');
xlabel('Number of Panels');
ylabel('Battery Capacity [kWh]');
zlabel('Grid Energy [kWh]');
title('Delivered energy to the grid vs. battery capacity and solar panels');

colormap(parula);          % Vibrant colormap
colorbar;                 % Show color scale
camlight headlight;       % Add lighting
lighting gouraud;         % Soft lighting model
view(135, 30);            % Set a good viewing angle

filename = "3D_Sizing_GridDelivered.png";
ax.Toolbar = [];
saveas(gcf, fullfile(foldername, filename));


% Grid delivered
Z = reshape(HyProd, size(param1_grid));

figure;
surf(panels, battery, Z');
xlabel('Number of Panels');
ylabel('Battery Capacity [kWh]');
zlabel('Hydrogen produced [kg]');
title('Produced hydrogen vs. battery capacity and solar panels');

colormap(parula);          % Vibrant colormap
colorbar;                 % Show color scale
camlight headlight;       % Add lighting
lighting gouraud;         % Soft lighting model
view(135, 30);            % Set a good viewing angle

filename = '3D_Sizing_HyProd.png';
ax.Toolbar = [];
saveas(gcf, fullfile(foldername, filename));


% Grid delivered
Z = reshape(HyCons, size(param1_grid));

figure;
surf(panels, battery, Z');
xlabel('Number of Panels');
ylabel('Battery Capacity [kWh]');
zlabel('Hydrogen consumed [kg]');
title('Consumed hydrogen vs. battery capacity and solar panels');

colormap(parula);          % Vibrant colormap
colorbar;                 % Show color scale
camlight headlight;       % Add lighting
lighting gouraud;         % Soft lighting model
view(135, 30);            % Set a good viewing angle

filename = "3D_Sizing_HyCons.png";
ax.Toolbar = [];
saveas(gcf, fullfile(foldername, filename));




%% Results of the FC Tests

StartSoC = [15, 20, 25];
StopSoC  = [70, 80, 90];

[param1_grid, param2_grid] = ndgrid(StartSoC, StopSoC);


param_combinations = [param1_grid(:), param2_grid(:)];
results = struct();
tests = size(param_combinations, 1);

for i = 1:tests
    loadStartSoC  = param_combinations(i, 1);
    loadStopSoC = param_combinations(i, 2);

    name = sprintf('EMS_FCTest_%d_StartSoC_%d_StopSoC.mat', loadStartSoC, loadStopSoC);
    load(name)

    grid_delivered(i) = max(results.Grid.Data(:,3));
    grid_pulled(i) = max(results.Grid.Data(:,4));

    HyProd(i) = max((results.Hydrogen.Data(:,2))/1000);
    HyCons(i) = max(results.Hydrogen.Data(:,4))/1000;

end


% Grid pulled:
Z = reshape(grid_pulled, size(param1_grid));

% 3D surface plot
figure;
surf(StartSoC, StopSoC, Z');
xlabel('Starting SoC [%]');
ylabel('Stopping SoC [%]');
zlabel('Grid Energy [kWh]');
zlim([min(grid_pulled)*0.95, max(grid_pulled)*1.05])
title('Pulled energy from the grid vs. fuel cell stopping and starting settings');

colormap(parula);          % Vibrant colormap
colorbar;                 % Show color scale
camlight headlight;       % Add lighting
lighting gouraud;         % Soft lighting model
view(135, 30);            % Set a good viewing angle

filename = "3D_FCTest_GridPulled.png";
ax.Toolbar = [];
saveas(gcf, fullfile(foldername, filename));



% Grid delivered
Z = reshape(grid_delivered, size(param1_grid));

figure;
surf(StartSoC, StopSoC, Z');
xlabel('Starting SoC [%]');
ylabel('Stopping SoC [%]');
zlabel('Grid Energy [kWh]');
zlim([min(grid_delivered)*0.95, max(grid_delivered)*1.05])
title('Delivered energy to the grid vs. fuel cell stopping and starting settings');

colormap(parula);          % Vibrant colormap
colorbar;                 % Show color scale
camlight headlight;       % Add lighting
lighting gouraud;         % Soft lighting model
view(135, 30);            % Set a good viewing angle

filename = "3D_FCTest_GridDelivered.png";
ax.Toolbar = [];
saveas(gcf, fullfile(foldername, filename));


% Grid delivered
Z = reshape(HyProd, size(param1_grid));

figure;
surf(StartSoC, StopSoC, Z');
xlabel('Starting SoC [%]');
ylabel('Stopping SoC [%]');
zlabel('Hydrogen produced [kg]');
zlim([min(HyProd)*0.95, max(HyProd)*1.05])
title('Produced hydrogen vs. fuel cell stopping and starting settings');

colormap(parula);          % Vibrant colormap
colorbar;                 % Show color scale
camlight headlight;       % Add lighting
lighting gouraud;         % Soft lighting model
view(135, 30);            % Set a good viewing angle

filename = "3D_FCTest_HyProd.png";
ax.Toolbar = [];
saveas(gcf, fullfile(foldername, filename));



% Grid delivered
Z = reshape(HyCons, size(param1_grid));

figure;
surf(StartSoC, StopSoC, Z');
xlabel('Starting SoC [%]');
ylabel('Stopping SoC [%]');
zlabel('Hydrogen consumed [kg]');
zlim([min(HyCons)*0.95, max(HyCons)*1.05])
title('Consumed hydrogen vs. fuel cell stopping and starting settings');

colormap(parula);          % Vibrant colormap
colorbar;                 % Show color scale
camlight headlight;       % Add lighting
lighting gouraud;         % Soft lighting model
view(135, 30);            % Set a good viewing angle

filename = "3D_FCTest_HyCons.png";
ax.Toolbar = [];
saveas(gcf, fullfile(foldername, filename));


%% Results of the Electrolyser Tests: Starting SoC and Hour

StartSoC = [60, 70, 80];
StartHr  = [12, 13, 14, 15];

[param1_grid, param2_grid] = ndgrid(StartSoC, StartHr);

param_combinations = [param1_grid(:), param2_grid(:)];
results = struct();
tests = size(param_combinations, 1);

for i = 1:tests
    loadStartSoC  = param_combinations(i, 1);
    loadStartHr = param_combinations(i, 2);

    name = sprintf('EMS_Test_%d_StartSoC_%d_StartHr.mat', loadStartSoC, loadStartHr);
    load(name)

    grid_delivered(i) = max(results.Grid.Data(:,3));
    grid_pulled(i) = max(results.Grid.Data(:,4));

    HyProd(i) = max((results.Hydrogen.Data(:,2))/1000);
    HyCons(i) = max(results.Hydrogen.Data(:,4))/1000;

end


% Grid pulled:
Z = reshape(grid_pulled, size(param1_grid));

% 3D surface plot
figure;
surf(StartSoC, StartHr, Z');
xlabel('Starting SoC [%]');
ylabel('Starting hour [h]');
zlabel('Grid Energy [kWh]');
zlim([min(grid_pulled)*0.95, max(grid_pulled)*1.05])
title('Pulled energy from the grid vs. electrolyser starting hour and state of charge settings');

colormap(parula);          % Vibrant colormap
colorbar;                 % Show color scale
camlight headlight;       % Add lighting
lighting gouraud;         % Soft lighting model
view(135, 30);            % Set a good viewing angle

filename = "3D_ElecTest_GridPulled.png";
ax.Toolbar = [];
saveas(gcf, fullfile(foldername, filename));


% Grid delivered
Z = reshape(grid_delivered, size(param1_grid));

figure;
surf(StartSoC, StartHr, Z');
xlabel('Starting SoC [%]');
ylabel('Starting hour [h]');
zlabel('Grid Energy [kWh]');
zlim([min(grid_delivered)*0.95, max(grid_delivered)*1.05])
title('Delivered energy to the grid vs. electrolyser starting hour and state of charge settings');

colormap(parula);          % Vibrant colormap
colorbar;                 % Show color scale
camlight headlight;       % Add lighting
lighting gouraud;         % Soft lighting model
view(135, 30);            % Set a good viewing angle

filename = "3D_ElecTest_GridDelivered.png";
ax.Toolbar = [];
saveas(gcf, fullfile(foldername, filename));


% Grid delivered
Z = reshape(HyProd, size(param1_grid));

figure;
surf(StartSoC, StartHr, Z');
xlabel('Starting SoC [%]');
ylabel('Starting hour [h]');
zlabel('Hydrogen produced [kg]');
zlim([min(HyProd)*0.95, max(HyProd)*1.05])
title('Produced hydrogen vs. electrolyser starting hour and state of charge settings');

colormap(parula);          % Vibrant colormap
colorbar;                 % Show color scale
camlight headlight;       % Add lighting
lighting gouraud;         % Soft lighting model
view(135, 30);            % Set a good viewing angle

filename = "3D_ElecTest_HyProd.png";
ax.Toolbar = [];
saveas(gcf, fullfile(foldername, filename));



% Grid delivered
Z = reshape(HyCons, size(param1_grid));

figure;
surf(StartSoC, StartHr, Z');
xlabel('Starting SoC [%]');
ylabel('Starting hour [h]');
zlabel('Hydrogen consumed [kg]');
zlim([min(HyCons)*0.95, max(HyCons)*1.05])
title('Consumed hydrogen vs. electrolyser starting hour and state of charge settings');

colormap(parula);          % Vibrant colormap
colorbar;                 % Show color scale
camlight headlight;       % Add lighting
lighting gouraud;         % Soft lighting model
view(135, 30);            % Set a good viewing angle

filename = "3D_ElecTest_HyCons.png";
ax.Toolbar = [];
saveas(gcf, fullfile(foldername, filename));



%% Results of the Electrolyser Tests: Starting SoC stopping SoC


StartSoC = 70;
StopSoC  = [45, 50, 55, 60, 65];
results = struct();

for i = 1:5
    
    loadStopSoC = StopSoC(i);
    name = sprintf('EMS_Test_%d_StartSoC_%d_StopSoC.mat', StartSoC, loadStopSoC);
    load(name)

    grid_delivered(i) = max(results.Grid.Data(:,3));
    grid_pulled(i) = max(results.Grid.Data(:,4));

    HyProd(i) = max((results.Hydrogen.Data(:,2))/1000);
    HyCons(i) = max(results.Hydrogen.Data(:,4))/1000;

end


figure;
plot(StopSoC, grid_pulled, LineWidth = 2);
xlabel('Stopping SoC [%]');
ylabel('Grid Energy [kWh]');
title('Pulled energy from the grid vs. electrolyser stopping state of charge settings');

filename = "2D_ElecTest_GridPulled.png";
ax.Toolbar = [];
saveas(gcf, fullfile(foldername, filename));


figure;
plot(StopSoC, grid_delivered, LineWidth = 2);
xlabel('stopping SoC [%]');
ylabel('Grid energy [kWh]');
title('Delivered energy to the grid vs. electrolyser stopping state of charge settings');

filename = "2D_ElecTest_GridDelivered.png";
ax.Toolbar = [];
saveas(gcf, fullfile(foldername, filename));

figure;
plot(StopSoC, HyProd, LineWidth = 2, Color = 'r');
xlabel('Stopping SoC [%]');
ylabel('Hydrogen Produced [kg]');
title('Produced hydrogen vs. electrolyser stopping state of charge settings');

filename = "2D_ElecTest_HyProd.png";
ax.Toolbar = [];
saveas(gcf, fullfile(foldername, filename));


figure;
plot(StopSoC, HyCons, LineWidth = 2, Color = 'b');
xlabel('Stopping SoC [%]');
ylabel('Hydrogen consumed [kg]');
title('Consumed hydrogen vs. electrolyser stopping state of charge settings');

filename = "2D_ElecTest_HyCons.png";
ax.Toolbar = [];
saveas(gcf, fullfile(foldername, filename));
