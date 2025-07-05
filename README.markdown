# Solar Energy Analysis Project

## Description

The **Solar Energy Analysis Project** evaluates the suitability of solar energy systems across five distinct sites of varying sizes by analyzing weather, environmental, and solar energy data collected from January 2017 to December 2019. The project aims to determine the optimal solar system type for each site based on factors such as Global Horizontal Irradiance (GHI), Solar Zenith Angle, Relative Humidity, Temperature, and others. Using MATLAB, the project processes data, calculates correlation coefficients, generates visualizations (scatter plots, heatmaps, and bar charts), and computes monthly GHI statistics to inform solar system selection. The accompanying project report details the data cleaning process, analysis, and recommendations for solar system types (e.g., Monocrystalline, Thin-Film, Parabolic Trough) tailored to each site's environmental conditions.

## Project Structure

- **matlab_code.m**: MATLAB script for data cleaning, correlation analysis, visualization of GHI relationships with environmental factors, and monthly GHI statistics for five sites.
- **Site 1.csv**, **Site 2.csv**, **Site 3.csv**, **Site 4.csv**, **Site 5.csv**: Input datasets containing weather and solar energy data for each site.
- **Project Report.pdf**: Comprehensive report detailing the methodology, data analysis, solar system selection, and energy production calculations.
- **README.md**: This file, providing an overview and instructions for the project.

## Prerequisites

- **MATLAB**: Required to run the analysis script (`matlab_code.m`).
- **Input Data**: CSV files for each site (`Site 1.csv` to `Site 5.csv`) must be in the same directory as the MATLAB script.
- **MATLAB Toolboxes**: Ensure the Statistics and Machine Learning Toolbox is available for functions like `corrcoef` and `isoutlier`.

## Installation

1. Clone the repository:
   ```bash
   git clone https://github.com/your-username/solar-energy-analysis.git
   ```
2. Place the CSV data files (`Site 1.csv`, `Site 2.csv`, etc.) in the project directory.
3. Open MATLAB and navigate to the project directory.

## Usage

1. Open `matlab_code.m` in MATLAB.
2. Ensure the CSV files are in the same directory as the script.
3. Run the script to perform data cleaning, correlation analysis, and generate visualizations:
   ```matlab
   run('matlab_code.m')
   ```
4. Review the generated figures (heatmaps, scatter plots, bar charts) and console output for correlation coefficients and monthly GHI statistics.
5. Refer to `Project Report.pdf` for detailed analysis and solar system recommendations.

## Key Features

- **Data Cleaning**: Removes null columns, fills missing values using linear interpolation, and handles duplicate columns (e.g., Clearsky GHI).
- **Correlation Analysis**: Computes Pearson correlation coefficients between GHI and environmental factors, visualized via heatmaps.
- **Visualizations**: Generates scatter plots to explore relationships between GHI and factors like Solar Zenith Angle, Relative Humidity, and Temperature, and bar charts for monthly GHI statistics (mean, standard deviation, min, max).
- **Solar System Selection**: Recommends solar systems (e.g., Monocrystalline, Thin-Film, Parabolic Trough) based on site-specific conditions like humidity, temperature, and GHI consistency.
- **Energy Production**: Calculates energy production using the formula `Power = Efficiency x GHI x Area` and `Energy = Power x time`.

## Contributing

Contributions are welcome! Please follow these steps:
1. Fork the repository.
2. Create a new branch (`git checkout -b feature-branch`).
3. Make your changes and commit (`git commit -m 'Add new feature'`).
4. Push to the branch (`git push origin feature-branch`).
5. Open a pull request.

## Authors

- Ziad Ahmed
- Yousef Omar
- Abdullah Helmy
- Abdeldrahman Gomaa
- Seif Eldin Haythem
- Yassin El Khodary

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## Acknowledgments

- Data provided for analysis spans January 2017 to December 2019.
- MATLAB was used for all data processing and visualizations.