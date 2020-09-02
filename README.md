# PCrex-analysis
Analysis files for my senior thesis with the PREx and CREx experiments.

asymvtime.m: Matlab script that plots the mean for each BCM versus the run number. Probably associated with the AsymTime.C 

alphas_crex.m: Calculates alpha. Requires 36 .txt files from Elegant (six coil kick sizes for each of the six modulation coils) Alphas are stored in the variable called dets. The first four columns are the x and y coils, the fifth is the determinant of the 4x4 modulation matrix, the sixth is alpha_x, and the seventh is alpha_y. 
   * NOTE: This version is outdated and was replaced with find_alpha.m
   
centroid_plots.m: Makes the centroid versus distance plots. Requires 6 .txt files (one for each modulation coil). 
    
find_alpha.m: Calculates alpha. Requires 12 .txt files (two per coil). This is essentially the cleaner and better-documented version of alphas_crex.m. 

realdata_analysis.m: Makes plots comparing Elegant's alpha predictions with the real data for each beam tune. Also makes the colorful plot of alpha versus run number. Requires one formatted (see remove_star.py) .txt file for each slug. 
   
remove_star.py: Formats the experimental alpha .txt files by removing extra characters so Matlab can read them. 

FFT: Contains a Matlab script for analyzing the results of the FFT script I wrote for Caryn. 
