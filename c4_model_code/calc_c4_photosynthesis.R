# calc_c4_photosynthesis.R
## Description: This script defines a function to simulate leaf-level photosynthesis of C4 plants, 
## using user-specified options.
## Originator: Nick Smith

### function variable descriptions
#### calculated
# vpmax: the maximum rate of PEP carboxylation (µmol m-2 s-1)
#### prescribed
# func: the photosynthesis calculation function to use, options:
  # 1. 'collatz': Collatz et al. (1992)
# tleaf: leaf temperature (°C)
# ca: atmospheric co2 (µmol mol-1)
# par: photosynthetically active radiation at leaf surface (µmol m-2 s-1)
# q_yield: quantum yield (mol mol-1)
# abs: absoptance (unitless)
# ci_frac: ratio of intercellular to atmospheric co2 (unitless)
# func: ci response function to use, options:
  # 1. 'ca_frac': ci is calculated as a fraction of ca
# tref_vcmax: reference temperature for vcmax temperature correction (°C)
# vcmax_ref: vcmax at reference temperature (µmol m-2 s-1)
# func_vcmax_tresp: the vcmax temperature response function to use, options:
  # 1. 'collatz': Collatz et al. (1992)
# tref_vpmax: reference temperature for vpmax temperature correction (°C)
# vpmax_ref: vpmax at reference temperature (µmol m-2 s-1)
# func_vcmax_tresp: the vpmax temperature response function to use, options:
  # 1. 'collatz': Collatz et al. (1992)

## packages
library(R.utils)

## source functions
sourceDirectory('functions')

calc_c4_photosynthesis = function(func = 'collatz',
                                  tleaf = 25, ca = 400, par = 500,
                                  q_yield = 0.066, abs = 0.8,
                                  ca_frac = 0.8, func_ci = 'ca_frac',
                                  tref_vcmax = 25, vcmax_ref = 39, func_vcmax_tresp = 'collatz',
                                  tref_vpmax = 25, vpmax_ref = 0.78, func_vpmax_tresp = 'collatz'){
  
  if(func == 'collatz'){
    
    vcmax = calc_vcmax_tresp(tleaf = tleaf, tref = tref_vcmax, vcmax_ref = vcmax_ref, func = func_vcmax_tresp)
    vpmax = calc_vpmax_tresp(tleaf = tleaf, tref = tref_vpmax, vpmax_ref = vpmax_ref, func = func_vpmax_tresp)
    ci = ci_calc(ca = ca, ca_frac = ca_frac, func = func_ci)
    
    ac = vcmax
    aj = q_yield * abs * par
    ap = vpmax * ci
    
    a = pmin(ac, aj, ap)
    
    return(data.frame(tleaf, ca, par,
                      q_yield, abs,
                      vcmax, vpmax, ci, 
                      ac, aj, ap,
                      a))
    
  } else{
    
    return('invalid photosynthesis function specified')
    
  }
  
}