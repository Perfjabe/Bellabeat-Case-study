# Code Folder

This folder contains the R scripts used in the Bellabeat Case Study. Each script is modularized for clarity and reproducibility.

## Scripts
1. **data_cleaning.R**  
   - Loads and cleans the raw datasets.  
   - Handles missing values, renames columns, and formats dates.  

2. **exploratory_analysis.R**  
   - Performs exploratory data analysis to uncover trends and relationships.  
   - Summarizes key metrics like activity levels, sleep patterns, and calories burned.

3. **visualizations.R**  
   - Creates visualizations such as scatter plots, histograms, and trend lines.  
   - Saves plots to the `visualizations` folder for inclusion in reports.

## Usage
1. Place the required datasets in the `data/` folder.
2. Run the scripts in the following order:
   - `data_cleaning.R`
   - `exploratory_analysis.R`
   - `visualizations.R`
3. Ensure all necessary R packages are installed (`tidyverse`, `lubridate`, etc.).
