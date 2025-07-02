% site_1
clc;clear

site_1=readtable ("Site 1.csv");

% remove null column
clean_data2_site1=removevars (site_1,'Unnamed_18');

% remove any missing value in the data
if any(any(ismissing(clean_data2_site1)))
    clean_data2_site1= fillmissing(clean_data2_site1, 'linear');
   disp('The dataset does contain missing values.');
else
 disp('The dataset does not contain any missing values.');
end

%estimitating the corrcoefs site1
numeric_data = clean_data2_site1(:, 1:18);
numeric_data_array = table2array(numeric_data);
correlation_coefficients = corrcoef(numeric_data_array);
disp('correlation coefficient of site 1');
disp(correlation_coefficients(6:18,13));

figure;
colormap('jet');
imagesc(correlation_coefficients);
colorbar;
title('Heatmap of Correlation Coefficients in Site 1');
xticks(1:18);
yticks(1:18);
xticklabels(numeric_data.Properties.VariableNames);
yticklabels(numeric_data.Properties.VariableNames);
xtickangle(45);
pause(2);
disp('correlation coefficient of site 1');
figure;
scatter(clean_data2_site1.SolarZenithAngle,clean_data2_site1.GHI,'bx'); % ZenithAngle is inversely propotional with GHI
ylabel('GHI')
xlabel('Solar Zenith Angle')
title('site 1')
pause(2);
figure;
scatter(clean_data2_site1.ClearskyDNI,clean_data2_site1.GHI,'bx'); %clear sky dhi is Directlyy propotional with GHI
ylabel('GHI')
xlabel('Clear sky Dni')
title('site 1')
pause(2);
figure;
scatter(clean_data2_site1.Temperature,clean_data2_site1.GHI,'bx'); % temperature is directly propotional with GHI
ylabel('GHI')
xlabel('Temperature')
title('site 1')
pause(2);
scatter (clean_data2_site1.WindSpeed,clean_data2_site1.GHI,'bx');  % at high wind speed, GHI is decreasing
ylabel('GHI')
xlabel('Wind Speed')
title('site 1')
pause(2);
scatter(clean_data2_site1.SurfaceAlbedo,clean_data2_site1.GHI,'bx'); % surfaceAlbedo is almost inversely propotional with GHI
ylabel('GHI')
xlabel('Surface Albedo')
title('site 1')
pause(2);
scatter(clean_data2_site1.RelativeHumidity,clean_data2_site1.GHI,'bx'); % humidity is almost inversely propotional with GHI
ylabel('GHI')
xlabel('Relative Humidity')
title('site 1')
pause(2);
averages_ghi = zeros(1, 12); 
std_ghi = zeros(1, 12); 
min_ghi = zeros(1, 12); 
max_ghi = zeros(1, 12); 

for month = 1:12
    indices = find(site_1.Month == month);
    ghiValues = site_1.GHI(indices);
    averages_ghi(month) = mean(ghiValues);
    std_ghi(month) = std(ghiValues);
    min_ghi(month) = min(ghiValues); 
    max_ghi(month) = max(ghiValues);
end
figure;
month_names = {'Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec'};
bar(1:12, averages_ghi);
xlabel('Month','FontSize',12,'FontWeight','bold');
ylabel('Avg_GHI');
title('Mean Irradiance per Month');
xticks(1:12);
xticklabels(month_names)
grid on;
pause(2)
figure;
bar(1:12, std_ghi);
xlabel('Month');
ylabel('Standard Deviation of Irradiance');
title('Variability (Std Dev) of Irradiance per Month');
xticks(1:12);
xticklabels(month_names);
grid on;
figure;
subplot(2, 2, 1);
bar(1:12, min_ghi);
xlabel('Month');
ylabel('Minimum Irradiance');
title('Minimum Irradiance per Month');
xticks(1:12);
xticklabels(month_names);
grid on;

subplot(2, 2, 2);
bar(1:12, max_ghi);
xlabel('Month');
ylabel('Maximum Irradiance');
title('Maximum Irradiance per Month');
xticks(1:12);
xticklabels(month_names);
grid on;
pause(2)
%creating average GHI for every month
averages1 = zeros(1, 12);  

for month = 1:12
    indices = find(site_1.Month == month);
    ghiValues = site_1.GHI(indices);
    averages1(month) = mean(ghiValues);
    disp(averages1)
end

%-------------------------------------------------------------------------------------------------------------
% site_2
clean_data_site2=readtable ("Site 2.csv");
% remove null column

% remove any missing value in the data
if any(any(ismissing(clean_data_site2)))
    clean_data_site2= fillmissing(clean_data2_site2, 'linear');
   disp('The dataset does not contain any missing values.');
else
 disp('The dataset does not contain any missing values.');
end

% Calc corelation coefficients
numeric_data = clean_data_site2(:, 1:15);
numeric_data_array = table2array(numeric_data);
correlation_coefficients = corrcoef(numeric_data_array);
disp('correlation coefficient of site 2');
disp(correlation_coefficients(8:15,6));
% Create a Heatmap of Correlation Coefficients
figure;
colormap('jet');
imagesc(correlation_coefficients);
colorbar;
title('Heatmap of Correlation Coefficients in Site 2');
xticks(1:15);
yticks(1:15);
xticklabels(numeric_data.Properties.VariableNames);
yticklabels(numeric_data.Properties.VariableNames);
xtickangle(45);
pause(2);
%-------------------------------------------------------------------------

figure;
scatter(clean_data_site2.GHI,clean_data_site2.SolarZenithAngle,'bx'); % ZenithAngle is inversely propotional with GHI
ylabel('GHI')
xlabel('Solar Zenith Angle')
title('site 2')
pause(2);
figure;
scatter(clean_data_site2.GHI,clean_data_site2.RelativeHumidity,'bx'); % humidity is almost inversely propotional with GHI
ylabel('GHI')
xlabel('Relative Humidity')
title('site 2')
pause(2);
figure;
scatter(clean_data_site2.GHI,clean_data_site2.Temperature,'bx'); % temperature is directly propotional with GHI
ylabel('GHI')
xlabel('Temperature')
title('site 2')
pause(2);
scatter(clean_data_site2.GHI,clean_data_site2.RelativeHumidity,'bx'); % humidity is almost inversely propotional with GHI
ylabel('GHI')
xlabel('Relative Humidity')
title('site 2')
pause(2);
scatter (clean_data_site2.GHI,clean_data_site2.WindDirection,'bx');  % 2nd most corr
ylabel('GHI')
xlabel('Wind direction')
title('site 2')
pause(2);
scatter (clean_data_site2.GHI,clean_data_site2.PrecipitableWater,'bx');  %GHI is inversly on ppt water
xlabel('PPT WATER')
ylabel('GHI')
title('site 2')
pause(2);

scatter (clean_data_site2.GHI,clean_data_site2.WindSpeed,'bx');  % at high wind speed, GHI is decreasing
ylabel('GHI')
xlabel('Wind Speed')
title('site 2')
pause(2);

averages_ghi = zeros(1, 12); 
std_ghi = zeros(1, 12); 
min_ghi = zeros(1, 12); 
max_ghi = zeros(1, 12); 


for month = 1:12
       indices = find(clean_data_site2.Month == month);
   ghiValues = clean_data_site2.GHI(indices);
    averages_ghi(month) = mean(ghiValues);
    std_ghi(month) = std(ghiValues);
    min_ghi(month) = min(ghiValues); 
    max_ghi(month) = max(ghiValues);
end
figure;
month_names = {'Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec'};
bar(1:12, averages_ghi);
xlabel('Month','FontSize',12,'FontWeight','bold');
ylabel('Avg_GHI');
title('Mean Irradiance per Month');
xticks(1:12);
xticklabels(month_names);
grid on;
figure;
bar(1:12, std_ghi);
xlabel('Month','FontSize',12,'FontWeight','bold');
ylabel('Standard Deviation of Irradiance');
title('Variability (Std Dev) of Irradiance per Month');
xticks(1:12);
xticklabels(month_names);
grid on;
pause(2)
figure;
subplot(2, 2, 1);
bar(1:12, min_ghi);
xlabel('Month');
ylabel('Minimum Irradiance');
title('Minimum Irradiance per Month');
xticks(1:12);
xticklabels(month_names);
grid on;

subplot(2, 2, 2);
bar(1:12, max_ghi);
xlabel('Month');
ylabel('Maximum Irradiance');
title('Maximum Irradiance per Month');
xticks(1:12);
xticklabels(month_names);
grid on;
  
for month = 1:12
    indices = find(clean_data_site2.Month == month);
    ghiValues = clean_data_site2.GHI(indices);
    averages2(month) = mean(ghiValues);
    disp(averages2)
end

%------------------------------------------------------------------------------------------------------------------
% site 3
clc;clear
% Read the table
data=readtable ("Site 3.csv");

% Remove the first column and divided into year month, days hours and minutes
sdt = data{:,'Time'};
dt = datetime(sdt, 'InputFormat', 'yyyy-MM-dd HH:mm:ss'); 
data.Year = year(dt);
data.Day = day(dt);
data.Minute = minute(dt);
clean_data_site3 = data(:, 2:end);
% fillling rows with empty values and assign to clean_data
if any(any(ismissing(clean_data_site3)))
       disp('The dataset does contain missing values.');
    clean_data_site3 = fillmissing(clean_data_site3, 'linear');
  else
   disp('The dataset does not contain any missing values.');
end
%clean_data_site3=clean_data_site3(clean_data_site3.GHI~=0,:);

% Calc corelation coefficients



figure;
scatter(clean_data_site3.temp,clean_data_site3.GHI,'bx'); 
ylabel('GHI')
xlabel('temp')
title('site 3')
pause(2);
scatter(clean_data_site3.rain_1h,clean_data_site3.GHI,'bx');
ylabel('GHI')
xlabel('rain_1h')
title('site 3')
pause(2);
scatter(clean_data_site3.snow_1h,clean_data_site3.GHI,'bx'); 
ylabel('GHI')
xlabel('snow_1h')
title('site 3')
pause(2);
scatter(clean_data_site3.weather_type,clean_data_site3.GHI,'bx'); 
ylabel('GHI')
xlabel('weaather type')
title('site 3')
pause(2);
figure;
scatter (clean_data_site3.sunlightTime,clean_data_site3.GHI,'bx');  
ylabel('GHI')
xlabel('sunlightTime')
title('site 3')

figure;
scatter(clean_data_site3.humidity,clean_data_site3.GHI,'bx'); % humidity is almost inversely propotional with GHI
ylabel('GHI')
xlabel('Humidity')
title('site 3')


% Create a array of average GHI in every month 
averages_ghi3 = zeros(1, 12); 
std_ghi = zeros(1, 12); 
min_ghi = zeros(1, 12); 
max_ghi = zeros(1, 12); 


for month = 1:12
    indices = find(clean_data_site3.month == month);
    ghiValues = clean_data_site3.GHI(indices);
    averages_ghi3(month) = mean(ghiValues);
    std_ghi(month) = std(ghiValues);
    min_ghi(month) = min(ghiValues); 
    max_ghi(month) = max(ghiValues);
end
figure;

month_names = {'Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec'};
bar(1:12, averages_ghi3);
xlabel('Month','FontSize',12,'FontWeight','bold');
ylabel('Avg_GHI');
title('Mean Irradiance per Month');
xticks(1:12);
xticklabels(month_names);
grid on;
figure;
bar(1:12, std_ghi);
xlabel('Month','FontSize',12,'FontWeight','bold');
ylabel('Standard Deviation of Irradiance');
title('Variability (Std Dev) of Irradiance per Month');
xticks(1:12);
xticklabels(month_names);
grid on;
figure;
subplot(2, 2, 1);
bar(1:12, min_ghi);
xlabel('Month');
ylabel('Minimum Irradiance');
title('Minimum Irradiance per Month');
xticks(1:12);
xticklabels(month_names);
grid on;

subplot(2, 2, 2);
bar(1:12, max_ghi);
xlabel('Month');
ylabel('Maximum Irradiance');
title('Maximum Irradiance per Month');
xticks(1:12);
xticklabels(month_names);
grid on;

for month = 1:12
    indices = find(clean_data_site3.month == month);
    ghiValues =clean_data_site3.GHI(indices);
    averages3(month) = mean(ghiValues);
    disp(averages3)
end
clean_data_site3=removevars (clean_data_site3,'isSun');

% Calc corelation coefficients
numeric_data = clean_data_site3(:, 1:18);
numeric_data_array = table2array(numeric_data);
correlation_coefficients = corrcoef(numeric_data_array);
disp(correlation_coefficients(3:13,2));


% Create a Heatmap of Correlation Coefficients
figure;
colormap('jet');
imagesc(correlation_coefficients);
colorbar;
title('Heatmap of Correlation Coefficients');
xticks(1:18);
yticks(1:18);
xticklabels(numeric_data.Properties.VariableNames);
yticklabels(numeric_data.Properties.VariableNames);
xtickangle(45);


%------------------------------------------------------------------------------
%------------------------------------------------------------------------------
clc;clear
site_4=readtable ("Site 4.csv");
% check whether two duplicated columns or not
a=any(site_4.ClearskyGHI-site_4.GHI)
if a
   disp('there is no duplicated columns')
  else   
site_4=removevars (site_4,'ClearskyGHI');
 disp('there is duplicated columns')
end
clean_data_site4=site_4;

% Fillmissing null values if any

if any(any(ismissing(clean_data_site4)))
     disp('The dataset does contain missing values.');
    clean_data_site4 = fillmissing(clean_data_site4, 'linear');
  else
   disp('The dataset does not contain any missing values.');
end

%removing outliers
numericCols4 = isnumeric(clean_data_site4{:, 1:end-1});
outlierRows4 = any(isoutlier(clean_data_site4{:, numericCols4}), 2);
clean_data_site4(outlierRows4, :) = [];

%estimitating the corrcoefs site4
figure;
scatter(clean_data_site4.Temperature,clean_data_site4.GHI,'bx'); 
ylabel('GHI')
xlabel('temp')
title('site 4')
pause(2);
scatter( clean_data_site4.PrecipitableWater,clean_data_site4.GHI,'bx');
ylabel('GHI')
xlabel('PrecipitableWater')
title('site 4')
pause(2);
scatter(clean_data_site4.DewPoint,clean_data_site4.GHI,'bx'); 
ylabel('GHI')
xlabel('DewPoint')
title('site 4')
pause(2);
scatter(clean_data_site4.CloudType,clean_data_site4.GHI,'bx');
ylabel('GHI')
xlabel('CloudType')
title('site 4')

scatter(clean_data_site4.WindDirection,clean_data_site4.GHI,'bx');  
ylabel('GHI')
xlabel('WindDirection')
title('site 4')

scatter(clean_data_site4.WindSpeed,clean_data_site4.GHI,'bx'); 
ylabel('GHI')
xlabel('WindSpeed')
title('site 4')
figure;
scatter(clean_data_site4.RelativeHumidity,clean_data_site4.GHI,'bx'); 
ylabel('GHI')
xlabel('RelativeHumidity')
title('site 4')
figure;
scatter (clean_data_site4.SolarZenithAngle,clean_data_site4.GHI,'bx');  
ylabel('GHI')
xlabel('SolarZenithAngle')
title('site 4')



averages_ghi = zeros(1, 12); 
std_ghi = zeros(1, 12); 
min_ghi = zeros(1, 12); 
max_ghi = zeros(1, 12); 


for Month = 1:12
    indices = find(clean_data_site4.Month == Month);
    ghiValues = clean_data_site4.GHI(indices);
    averages_ghi(Month) = mean(ghiValues);
    std_ghi(Month) = std(ghiValues);
    min_ghi(Month) = min(ghiValues); 
    max_ghi(Month) = max(ghiValues);
end
figure;

month_names = {'Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec'};
bar(1:12, averages_ghi);
xlabel('Month','FontSize',12,'FontWeight','bold');
ylabel('Avg_GHI');
title('Mean Irradiance per Month');
xticks(1:12);
xticklabels(month_names);
grid on;
figure;
bar(1:12, std_ghi);
xlabel('Month','FontSize',12,'FontWeight','bold');
ylabel('Standard Deviation of Irradiance');
title('Variability (Std Dev) of Irradiance per Month');
xticks(1:12);
xticklabels(month_names);
grid on;

subplot(2, 2, 1);
bar(1:12, min_ghi);
xlabel('Month','FontSize',12,'FontWeight','bold');
ylabel('Minimum Irradiance');
title('Minimum Irradiance per Month');
xticks(1:12);
xticklabels(month_names);
grid on;

subplot(2, 2, 2);
bar(1:12, max_ghi);
xlabel('Month','FontSize',12,'FontWeight','bold');
ylabel('Maximum Irradiance');
title('Maximum Irradiance per Month');
xticks(1:12);
xticklabels(month_names);
grid on;

for month = 1:12
    indices = find(clean_data_site4.Month == month);
    ghiValues =clean_data_site4.GHI(indices);
    averages4(month) = mean(ghiValues);
    disp(averages4)
end

% Calc corelation coefficients
numeric_data = clean_data_site4(:, 1:15);
numeric_data_array = table2array(numeric_data);
correlation_coefficients = corrcoef(numeric_data_array);
disp(correlation_coefficients(8:15,6));

% Create Heatmap of Correlation Coefficients
figure;
colormap('jet');
imagesc(correlation_coefficients);
colorbar;
title('Heatmap of Correlation Coefficients site 4');
xticks(1:15);
yticks(1:15);
xticklabels(numeric_data.Properties.VariableNames);
yticklabels(numeric_data.Properties.VariableNames);
xtickangle(45);
pause(2);
%--------------------------------------------------------------------------
%--------------------------------------------------------------------------
% site_5
clc;clear

clean_data_site5=readtable ("Site 5.csv");

% check whether two duplicated columns or not
a=any(clean_data_site5.ClearskyGHI-clean_data_site5.GHI);
if a
   disp('there is no duplicated columns')
  else   
clean_data_site5=removevars (clean_data_site5,'ClearskyGHI');
 disp('there is duplicated columns')
end

% remove any missing value in the data
if any(any(ismissing(clean_data_site5)))
    clean_data_site5= fillmissing(clean_data_site5, 'linear');
   disp('The dataset does not contain any missing values.');
else
 disp('The dataset does not contain any missing values.');
end

%estimitating the corrcoefs site5

numeric_data = clean_data_site5(:, 1:15);
numeric_data_array = table2array(numeric_data);
correlation_coefficients = corrcoef(numeric_data_array);
disp('correlation coefficient of site 5');
disp(correlation_coefficients(8:15,6));

figure;
colormap('jet');
imagesc(correlation_coefficients);
colorbar;
title('Heatmap of Correlation Coefficients in Site 5');
xticks(1:15);
yticks(1:15);
xticklabels(numeric_data.Properties.VariableNames);
yticklabels(numeric_data.Properties.VariableNames);
xtickangle(45);
pause(2);
disp('correlation coefficient of site 5');
figure;
scatter(clean_data_site5.SolarZenithAngle,clean_data_site5.GHI,'bx'); % ZenithAngle is inversely propotional with GHI
ylabel('GHI')
xlabel('Solar Zenith Angle')
title('site 5')
pause(2);
figure;
scatter(clean_data_site5.DewPoint,clean_data_site5.GHI,'bx'); %clear sky dhi is Directlyy propotional with GHI
ylabel('GHI')
xlabel('Dew point')
title('site 5')
pause(2);
figure;
scatter(clean_data_site5.GHI,clean_data2_site1.Temperature,'bx'); % temperature is directly propotional with GHI
ylabel('GHI')
xlabel('Temperature')
title('site 5')
pause(2);
scatter (clean_data_site5.GHI,clean_data_site5.CloudType,'bx');  % at high wind speed, GHI is decreasing
ylabel('GHI')
xlabel('cloud type')
title('site 5')
pause(2);
scatter(clean_data_site5.GHI,clean_data_site5.WindSpeed,'bx'); % surfaceAlbedo is almost inversely propotional with GHI
ylabel('GHI')
xlabel('Wind Speed')
title('site 5')
pause(2);
scatter(clean_data_site5.RelativeHumidity,clean_data_site5.GHI,'bx'); % humidity is almost inversely propotional with GHI
ylabel('GHI')
xlabel('Relative Humidity')
title('site 5')
pause(2);
scatter(clean_data_site5.WindDirection,clean_data_site5.GHI,'bx'); % humidity is almost inversely propotional with GHI
ylabel('GHI')
xlabel('Relative Humidity')
title('site 5')
pause(2);
scatter(clean_data_site5.PrecipitableWater,clean_data_site5.GHI,'bx'); % humidity is almost inversely propotional with GHI
ylabel('GHI')
xlabel('Precipitable Water')
title('site 5')
pause(2);
averages_ghi = zeros(1, 12); 
std_ghi = zeros(1, 12); 
min_ghi = zeros(1, 12); 
max_ghi = zeros(1, 12); 

for month = 1:12
    indices = find(clean_data_site5.Month == month);
    ghiValues = clean_data_site5.GHI(indices);
    averages_ghi(month) = mean(ghiValues);
    std_ghi(month) = std(ghiValues);
    min_ghi(month) = min(ghiValues); 
    max_ghi(month) = max(ghiValues);
end
figure;
month_names = {'Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec'};
bar(1:12, averages_ghi);
xlabel('Month','FontSize',12,'FontWeight','bold');
ylabel('Avg_GHI');
title('Mean Irradiance per Month');
xticks(1:12);
xticklabels(month_names)
grid on;
pause(2)
figure;
bar(1:12, std_ghi);
xlabel('Month');
ylabel('Standard Deviation of Irradiance');
title('Variability (Std Dev) of Irradiance per Month');
xticks(1:12);
xticklabels(month_names);
grid on;
figure;
subplot(2, 2, 1);
bar(1:12, min_ghi);
xlabel('Month');
ylabel('Minimum Irradiance');
title('Minimum Irradiance per Month');
xticks(1:12);
xticklabels(month_names);
grid on;

subplot(2, 2, 2);
bar(1:12, max_ghi);
xlabel('Month');
ylabel('Maximum Irradiance');
title('Maximum Irradiance per Month');
xticks(1:12);
xticklabels(month_names);
grid on;
pause(2)
%creating average GHI for every month
averages1 = zeros(1, 12);  

for month = 1:12
    indices = find(clean_data_site5.Month == month);
    ghiValues = site_1.GHI(indices);
    averages1(month) = mean(ghiValues);
    disp(averages5)
end


