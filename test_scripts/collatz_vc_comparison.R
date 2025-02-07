# collatz_vc_comparison.R
## Description: This script compares the collatz can von caemmerer options for the calc_c4_photosynthesis script.
## Originator: Nick Smith

### load libraries
library(tidyverse)

### source code
source('../c4_model_code/calc_c4_photosynthesis.R')
sourceDirectory('../c4_model_code/functions')

### does function run?
calc_c4_photosynthesis()

### run collatz and von caemmerer light curves
collatz_c4_light_curve_lowco2 = calc_c4_photosynthesis(par = seq(10, 2000, 10), ca = 400, func = 'collatz')
collatz_c4_light_curve_lowco2 = calc_c4_photosynthesis(par = seq(10, 2000, 10), ca = 400, func = 'von caemmerer')

