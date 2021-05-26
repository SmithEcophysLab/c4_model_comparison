# calc_ci.R
## Description: This script defines a function to calculate intercellular CO2 (ci)
## based on a user-specified function.
## The current default is to define ci based on a specified fraction of atmospheric CO2 (ca).
## Originator: Nick Smith

### function variable descriptions
#### calculated
# ci: intercellular CO2 (µmol mol-1)
#### prescribed
# ca: atmospheric co2 (µmol mol-1)
# ci_frac: ratio of intercellular to atmospheric co2 (unitless)
# func: ci response function to use, options:
  # 1. 'ca_frac': ci is calculated as a fraction of ca

## function
ci_calc = function(ca = 400, ca_frac = 0.8, func = 'ca_frac'){

  if(func == 'ca_frac'){
    
    ci = ca * 0.8
    return(ci)
    
  } else{
    
    return('invalid ci response function specified')
    
  }

}
