# c4_model_comparison
This repository houses code to compare different versions of models of C4 photosynthesis.
The code is designed to integrate different functions and parameterizations for C4
photosynthesis models and examine their sensitivity to environmental gradients.
The repository was developed as the result of a USGS Powell Center working group on
C4 photosynthesis. It is planned that the content of the repository will evolve alongside
the goals of the working group.

## file directory

### [/c4_model_code](c4_model_code)
This folder contains all the code to run the C4 photosynthesis model 
using user specified options.
Included is the (R script defining the primary model function
to calculate rates of photosynthesis)[c4_model_code/calc_c4_photosynthesis.R]
and a (folder containing sub-functions)[c4_model_code/functions].

### (/test_scripts)[test_scripts]
This folder contains scripts for testing the model code.