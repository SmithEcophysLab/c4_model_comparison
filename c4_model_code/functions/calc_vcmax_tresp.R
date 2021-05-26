# calc_vcmax_tresp.R
## Description: This script defines a function to calculate vcmax at a specified temperature
## based on a user-specified response function.
## The current default is to use the function described by Collatz et al. (1992).
## Originator: Nick Smith

### function variable descriptions
#### calculated
# vcmax: the maximum rate of Rubisco carboxylation (µmol m-2 s-1)
#### prescribed
# tleaf: leaf temperature (°C)
# tref: reference temperature (°C)
# vcmax_ref: vcmax at reference temperature (µmol m-2 s-1)
# response: the temperature response function to use, options:
  # 1. 'collatz': Collatz et al. (1992)

## function
calc_vcmax_tresp = function(tleaf = 25, tref = 25, vcmax_ref = 39, func = 'collatz'){ 
  # tleaf: leaf temperature (°C)
  # tref: reference temperature (°C)
  # vcmax_ref: vcmax at reference temperature (µmol m-2 s-1)
  # response: the temperature response function to use, options:
    # 1. 'collatz': Collatz et al. (1992)
  
  if(func == 'collatz'){
    
    top = vcmax_ref * 2 ^ ((tleaf - tref) / 10)
    bottom = (1 + exp(0.3 * (13 - tleaf))) * (1 + exp(0.3 * (tleaf - 36)))
    
    vcmax = top/bottom
    return(vcmax)
    
  } else{
    
    return('invalid vcmax temperature response function specified')
    
  }
  
}
