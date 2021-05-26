# calc_vpmax_tresp.R
## Description: This script defines a function to calculate vpmax at a specified temperature
## based on a user-specified response function.
## The current default is to use the function described by Collatz et al. (1992).
## Originator: Nick Smith

### function variable descriptions
#### calculated
# vpmax: the maximum rate of PEP carboxylation (µmol m-2 s-1)
#### prescribed
# tleaf: leaf temperature (°C)
# tref: reference temperature (°C)
# vpmax_ref: vpmax at reference temperature (µmol m-2 s-1)
# response: the temperature response function to use, options:
  # 1. 'collatz': Collatz et al. (1992)

## function
calc_vpmax_tresp = function(tleaf = 25, tref = 25, vpmax_ref = 0.78, func = 'collatz'){ 

  if(func == 'collatz'){
    
    vpmax = vpmax_ref * 2 ^ ((tleaf - tref) / 10)
    
    return(vpmax)
    
  } else{
    
    return('invalid vpmax temperature response function specified')
    
  }
  
}
