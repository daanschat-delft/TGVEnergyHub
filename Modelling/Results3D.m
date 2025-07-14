%% Results of the sizing tests

TitleSize = 20;
FontSize = 18;

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
xlabel('Number of Panels', 'FontSize', FontSize);
ylabel('Battery cap. [kWh]', 'FontSize', FontSize);
zlabel('Grid Energy [kWh]', 'FontSize', FontSize);
title('Pulled grid energy vs. battery cap. & PV panels', 'FontSize', TitleSize);

colormap(parula);          % Vibrant colormap
colorbar;                 % Show color scale
camlight headlight;       % Add lighting
lighting gouraud;         % Soft lighting model
view(135, 30);            % Set a good viewing angle

filename = 'Big_3D_Sizing_GridPulled.png';
ax.Toolbar = [];
saveas(gcf, fullfile(foldername, filename));



% Grid delivered
Z = reshape(grid_delivered, size(param1_grid));

figure;
surf(panels, battery, Z');
xlabel('Number of Panels', 'FontSize', FontSize);
ylabel('Battery cap. [kWh]', 'FontSize', FontSize);
zlabel('Grid Energy [kWh]', 'FontSize', FontSize);
title('Delivered grid energy vs. battery cap. & PV panels', 'FontSize', TitleSize);

colormap(parula);          % Vibrant colormap
colorbar;                 % Show color scale
camlight headlight;       % Add lighting
lighting gouraud;         % Soft lighting model
view(135, 30);            % Set a good viewing angle

filename = "Big_3D_Sizing_GridDelivered.png";
ax.Toolbar = [];
saveas(gcf, fullfile(foldername, filename));


% Grid delivered
Z = reshape(HyProd, size(param1_grid));

figure;
surf(panels, battery, Z');
xlabel('Number of Panels', 'FontSize', FontSize);
ylabel('Battery cap. [kWh]', 'FontSize', FontSize);
zlabel('Hydrogen produced [kg]', 'FontSize', FontSize);
title('Prod. hydrogen vs. battery cap. & PV panels', 'FontSize', TitleSize);

colormap(parula);         % Vibrant colormap
colorbar;                 % Show color scale
camlight headlight;       % Add lighting
lighting gouraud;         % Soft lighting model
view(135, 30);            % Set a good viewing angle

filename = 'Big_3D_Sizing_HyProd.png';
ax.Toolbar = [];
saveas(gcf, fullfile(foldername, filename));


% Grid delivered
Z = reshape(HyCons, size(param1_grid));

figure;
surf(panels, battery, Z');
xlabel('Number of Panels', 'FontSize', FontSize);
ylabel('Battery cap. [kWh]', 'FontSize', FontSize);
zlabel('Hydrogen consumed [kg]', 'FontSize', FontSize);
title('Cons. hydrogen vs. battery cap. & PV panels', 'FontSize', TitleSize);

colormap(parula);          % Vibrant colormap
colorbar;                 % Show color scale
camlight headlight;       % Add lighting
lighting gouraud;         % Soft lighting model
view(135, 30);            % Set a good viewing angle

filename = "Big_3D_Sizing_HyCons.png";
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
xlabel('Starting SoC [%]', 'FontSize', FontSize);
ylabel('Stopping SoC [%]', 'FontSize', FontSize);
zlabel('Grid Energy [kWh]', 'FontSize', FontSize);
zlim([min(grid_pulled)*0.95, max(grid_pulled)*1.05])
title('Pulled grid energy vs. FC EMS settings', 'FontSize', TitleSize);

colormap(parula);          % Vibrant colormap
colorbar;                 % Show color scale
camlight headlight;       % Add lighting
lighting gouraud;         % Soft lighting model
view(135, 30);            % Set a good viewing angle

filename = "Big_3D_FCTest_GridPulled.png";
ax.Toolbar = [];
saveas(gcf, fullfile(foldername, filename));



% Grid delivered
Z = reshape(grid_delivered, size(param1_grid));

figure;
surf(StartSoC, StopSoC, Z');
xlabel('Starting SoC [%]', 'FontSize', FontSize);
ylabel('Stopping SoC [%]', 'FontSize', FontSize);
zlabel('Grid Energy [kWh]', 'FontSize', FontSize);
zlim([min(grid_delivered)*0.95, max(grid_delivered)*1.05])
title('Delivered grid energy vs. FC EMS settings', 'FontSize', TitleSize);

colormap(parula);          % Vibrant colormap
colorbar;                 % Show color scale
camlight headlight;       % Add lighting
lighting gouraud;         % Soft lighting model
view(135, 30);            % Set a good viewing angle

filename = "Big_3D_FCTest_GridDelivered.png";
ax.Toolbar = [];
saveas(gcf, fullfile(foldername, filename));


% Grid delivered
Z = reshape(HyProd, size(param1_grid));

figure;
surf(StartSoC, StopSoC, Z');
xlabel('Starting SoC [%]', 'FontSize', FontSize);
ylabel('Stopping SoC [%]', 'FontSize', FontSize);
zlabel('Hydrogen produced [kg]', 'FontSize', FontSize);
zlim([min(HyProd)*0.95, max(HyProd)*1.05])
title('Prod. hydrogen vs. FC EMS settings', 'FontSize', TitleSize);

colormap(parula);          % Vibrant colormap
colorbar;                 % Show color scale
camlight headlight;       % Add lighting
lighting gouraud;         % Soft lighting model
view(135, 30);            % Set a good viewing angle

filename = "Big_3D_FCTest_HyProd.png";
ax.Toolbar = [];
saveas(gcf, fullfile(foldername, filename));



% Grid delivered
Z = reshape(HyCons, size(param1_grid));

figure;
surf(StartSoC, StopSoC, Z');
xlabel('Starting SoC [%]', 'FontSize', FontSize);
ylabel('Stopping SoC [%]', 'FontSize', FontSize);
zlabel('Hydrogen consumed [kg]', 'FontSize', FontSize);
zlim([min(HyCons)*0.95, max(HyCons)*1.05])
title('Cons. hydrogen vs. FC EMS settings', 'FontSize', TitleSize);

colormap(parula);          % Vibrant colormap
colorbar;                 % Show color scale
camlight headlight;       % Add lighting
lighting gouraud;         % Soft lighting model
view(135, 30);            % Set a good viewing angle

filename = "Big_3D_FCTest_HyCons.png";
ax.Toolbar = [];
saveas(gcf, fullfile(foldername, filename));


%% Results of the Electrolyser Tests: Starting SoC & Hour

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
xlabel('Starting SoC [%]', 'FontSize', FontSize);
ylabel('Starting hour [h]', 'FontSize', FontSize);
zlabel('Grid Energy [kWh]', 'FontSize', FontSize);
zlim([min(grid_pulled)*0.95, max(grid_pulled)*1.05])
title('Pulled grid energy vs. Elec EMS settings', 'FontSize', TitleSize);

colormap(parula);          % Vibrant colormap
colorbar;                 % Show color scale
camlight headlight;       % Add lighting
lighting gouraud;         % Soft lighting model
view(135, 30);            % Set a good viewing angle

filename = "Big_3D_ElecTest_GridPulled.png";
ax.Toolbar = [];
saveas(gcf, fullfile(foldername, filename));


% Grid delivered
Z = reshape(grid_delivered, size(param1_grid));

figure;
surf(StartSoC, StartHr, Z');
xlabel('Starting SoC [%]', 'FontSize', FontSize);
ylabel('Starting hour [h]', 'FontSize', FontSize);
zlabel('Grid Energy [kWh]', 'FontSize', FontSize);
zlim([min(grid_delivered)*0.95, max(grid_delivered)*1.05])
title('Delivered grid energy vs. Elec EMS settings', 'FontSize', TitleSize);

colormap(parula);          % Vibrant colormap
colorbar;                 % Show color scale
camlight headlight;       % Add lighting
lighting gouraud;         % Soft lighting model
view(135, 30);            % Set a good viewing angle

filename = "Big_3D_ElecTest_GridDelivered.png";
ax.Toolbar = [];
saveas(gcf, fullfile(foldername, filename));


% Grid delivered
Z = reshape(HyProd, size(param1_grid));

figure;
surf(StartSoC, StartHr, Z');
xlabel('Starting SoC [%]', 'FontSize', FontSize);
ylabel('Starting hour [h]', 'FontSize', FontSize);
zlabel('Hydrogen produced [kg]', 'FontSize', FontSize);
zlim([min(HyProd)*0.95, max(HyProd)*1.05])
title('Prod. hydrogen vs. Elec EMS settings', 'FontSize', TitleSize);

colormap(parula);          % Vibrant colormap
colorbar;                 % Show color scale
camlight headlight;       % Add lighting
lighting gouraud;         % Soft lighting model
view(135, 30);            % Set a good viewing angle

filename = "Big_3D_ElecTest_HyProd.png";
ax.Toolbar = [];
saveas(gcf, fullfile(foldername, filename));

% Grid delivered
Z = reshape(HyCons, size(param1_grid));

figure;
surf(StartSoC, StartHr, Z');
xlabel('Starting SoC [%]', 'FontSize', FontSize);
ylabel('Starting hour [h]', 'FontSize', FontSize);
zlabel('Hydrogen consumed [kg]', 'FontSize', FontSize);
zlim([min(HyCons)*0.95, max(HyCons)*1.05])
title('Cons. hydrogen vs. Elec EMS settings', 'FontSize', TitleSize);

colormap(parula);          % Vibrant colormap
colorbar;                 % Show color scale
camlight headlight;       % Add lighting
lighting gouraud;         % Soft lighting model
view(135, 30);            % Set a good viewing angle

filename = "Big_3D_ElecTest_HyCons.png";
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
xlabel('Stopping SoC [%]', 'FontSize', FontSize);
ylabel('Grid Energy [kWh]', 'FontSize', FontSize);
title('Pulled grid energy vs. Elec stopping EMS settings', 'FontSize', TitleSize);

filename = "Big_2D_ElecTest_GridPulled.png";
ax.Toolbar = [];
saveas(gcf, fullfile(foldername, filename));


figure;
plot(StopSoC, grid_delivered, LineWidth = 2);
xlabel('stopping SoC [%]', 'FontSize', FontSize);
ylabel('Grid energy [kWh]', 'FontSize', FontSize);
title('Delivered grid energy vs. Elec stopping EMS settings', 'FontSize', TitleSize);

filename = "Big_2D_ElecTest_GridDelivered.png";
ax.Toolbar = [];
saveas(gcf, fullfile(foldername, filename));

figure;
plot(StopSoC, HyProd, LineWidth = 2, Color = 'r');
xlabel('Stopping SoC [%]', 'FontSize', FontSize);
ylabel('Hydrogen Produced [kg]', 'FontSize', FontSize);
title('Prod. hydrogen vs. Elec stopping EMS settings', 'FontSize', TitleSize);

filename = "Big_2D_ElecTest_HyProd.png";
ax.Toolbar = [];
saveas(gcf, fullfile(foldername, filename));


figure;
plot(StopSoC, HyCons, LineWidth = 2, Color = 'b');
xlabel('Stopping SoC [%]', 'FontSize', FontSize);
ylabel('Hydrogen consumed [kg]', 'FontSize', FontSize);
title('Cons. hydrogen vs. Elec stopping EMS settings', 'FontSize', TitleSize);

filename = "Big_2D_ElecTest_HyCons.png";
ax.Toolbar = [];
saveas(gcf, fullfile(foldername, filename));
