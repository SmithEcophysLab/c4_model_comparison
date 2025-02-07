# collatz_test.R
## Description: This script test the collatz option for the calc_c4_photosynthesis script.
## Originator: Nick Smith

### load libraries
library(tidyverse)

### source code
source('../c4_model_code/calc_c4_photosynthesis.R')
sourceDirectory('../c4_model_code/functions')

### does function run?
calc_c4_photosynthesis()

### response curves
collatz_c4_co2_curve_lowlight = calc_c4_photosynthesis(ca = seq(10, 600, 10), par = 500, func = 'collatz')
collatz_c4_co2_curve_highlight = calc_c4_photosynthesis(ca = seq(10, 600, 10), par = 1000, func = 'collatz')
collatz_c4_light_curve_lowco2 = calc_c4_photosynthesis(par = seq(10, 2000, 10), ca = 400, func = 'collatz')
collatz_c4_light_curve_highco2 = calc_c4_photosynthesis(par = seq(10, 2000, 10), ca = 1000, func = 'collatz')
collatz_c4_temperature_curve_lowlight = calc_c4_photosynthesis(tleaf = seq(1, 40, 1), par = 500, func = 'collatz')
collatz_c4_temperature_curve_highlight = calc_c4_photosynthesis(tleaf = seq(1, 40, 1), par = 1000, func = 'collatz')

### make figures
#### CO2 response
collatz_c4_co2_plot_lowlight = ggplot(data = collatz_c4_co2_curve_lowlight, 
                                      aes(x = ca, y = a)) +
  theme(legend.position = NULL, 
        axis.title.y=element_text(size=rel(2), colour = 'black'), # change y axis title properties
        axis.title.x=element_text(size=rel(2), colour = 'black'), # change x axis title properties
        axis.text.x=element_text(size=rel(2), colour = 'black'), # change x axis text properties
        axis.text.y=element_text(size=rel(2), colour = 'black'), # change y axis text properties
        panel.background = element_rect(fill = 'white', colour = 'black'), # change background panel colors
        panel.grid.major = element_line(colour = "grey") # change backgrond color
  ) +
  geom_line(size = 5, color = 'grey') +
  geom_line(size = 4, color = 'orange', lty = 3, aes(y = aj)) +
  geom_line(size = 4, color = 'blue', lty = 3, aes(y = ac)) +
  geom_line(size = 4, color = 'darkgreen', lty = 3, aes(y = ap)) +
  ylim(c(0, 60)) +
  ylab(expression('Photosynthesis (µmol m' ^ '-2' * ' s' ^ '-1' *')')) +
  xlab(expression('Atm. CO'[2] * ' (µmol mol' ^ '-1' * ')'))

collatz_c4_co2_plot_highlight = ggplot(data = collatz_c4_co2_curve_highlight, 
                                       aes(x = ca, y = a)) +
  theme(legend.position = NULL, 
        axis.title.y=element_text(size=rel(2), colour = 'black'), # change y axis title properties
        axis.title.x=element_text(size=rel(2), colour = 'black'), # change x axis title properties
        axis.text.x=element_text(size=rel(2), colour = 'black'), # change x axis text properties
        axis.text.y=element_text(size=rel(2), colour = 'black'), # change y axis text properties
        panel.background = element_rect(fill = 'white', colour = 'black'), # change background panel colors
        panel.grid.major = element_line(colour = "grey") # change backgrond color
  ) +
  geom_line(size = 5, color = 'grey') +
  geom_line(size = 4, color = 'orange', lty = 3, aes(y = aj)) +
  geom_line(size = 4, color = 'blue', lty = 3, aes(y = ac)) +
  geom_line(size = 4, color = 'darkgreen', lty = 3, aes(y = ap)) +
  ylim(c(0, 60)) +
  ylab(expression('Photosynthesis (µmol m' ^ '-2' * ' s' ^ '-1' *')')) +
  xlab(expression('Atm. CO'[2] * ' (µmol mol' ^ '-1' * ')'))

#### light response
collatz_c4_light_plot_lowco2 = ggplot(data = collatz_c4_light_curve_lowco2, 
                                      aes(x = par, y = a)) +
  theme(legend.position = NULL, 
        axis.title.y=element_text(size=rel(2), colour = 'black'), # change y axis title properties
        axis.title.x=element_text(size=rel(2), colour = 'black'), # change x axis title properties
        axis.text.x=element_text(size=rel(2), colour = 'black'), # change x axis text properties
        axis.text.y=element_text(size=rel(2), colour = 'black'), # change y axis text properties
        panel.background = element_rect(fill = 'white', colour = 'black'), # change background panel colors
        panel.grid.major = element_line(colour = "grey") # change backgrond color
  ) +
  geom_line(size = 5, color = 'grey') +
  geom_line(size = 4, color = 'orange', lty = 3, aes(y = aj)) +
  geom_line(size = 4, color = 'blue', lty = 3, aes(y = ac)) +
  geom_line(size = 4, color = 'darkgreen', lty = 3, aes(y = ap)) +
  ylim(c(0, 60)) +
  ylab(expression('Photosynthesis (µmol m' ^ '-2' * ' s' ^ '-1' *')')) +
  xlab(expression('PAR (µmol m' ^ '-2' * ' s' ^ '-1' *')'))

collatz_c4_light_plot_highco2 = ggplot(data = collatz_c4_light_curve_highco2, 
                                       aes(x = par, y = a)) +
  theme(legend.position = NULL, 
        axis.title.y=element_text(size=rel(2), colour = 'black'), # change y axis title properties
        axis.title.x=element_text(size=rel(2), colour = 'black'), # change x axis title properties
        axis.text.x=element_text(size=rel(2), colour = 'black'), # change x axis text properties
        axis.text.y=element_text(size=rel(2), colour = 'black'), # change y axis text properties
        panel.background = element_rect(fill = 'white', colour = 'black'), # change background panel colors
        panel.grid.major = element_line(colour = "grey") # change backgrond color
  ) +
  geom_line(size = 5, color = 'grey') +
  geom_line(size = 4, color = 'orange', lty = 3, aes(y = aj)) +
  geom_line(size = 4, color = 'blue', lty = 3, aes(y = ac)) +
  geom_line(size = 4, color = 'darkgreen', lty = 3, aes(y = ap)) +
  ylim(c(0, 60)) +
  ylab(expression('Photosynthesis (µmol m' ^ '-2' * ' s' ^ '-1' *')')) +
  xlab(expression('PAR (µmol m' ^ '-2' * ' s' ^ '-1' *')'))

#### temperature plot
collatz_c4_temperature_plot_lowlight = ggplot(data = collatz_c4_temperature_curve_lowlight, 
                                              aes(x = tleaf, y = a)) +
  theme(legend.position = NULL, 
        axis.title.y=element_text(size=rel(2), colour = 'black'), # change y axis title properties
        axis.title.x=element_text(size=rel(2), colour = 'black'), # change x axis title properties
        axis.text.x=element_text(size=rel(2), colour = 'black'), # change x axis text properties
        axis.text.y=element_text(size=rel(2), colour = 'black'), # change y axis text properties
        panel.background = element_rect(fill = 'white', colour = 'black'), # change background panel colors
        panel.grid.major = element_line(colour = "grey") # change backgrond color
  ) +
  geom_line(size = 5, color = 'grey') +
  geom_line(size = 4, color = 'orange', lty = 3, aes(y = aj)) +
  geom_line(size = 4, color = 'blue', lty = 3, aes(y = ac)) +
  geom_line(size = 4, color = 'darkgreen', lty = 3, aes(y = ap)) +
  ylim(c(0, 60)) +
  ylab(expression('Photosynthesis (µmol m' ^ '-2' * ' s' ^ '-1' *')')) +
  xlab(expression('Leaf Temperature (°C)'))

collatz_c4_temperature_plot_highlight = ggplot(data = collatz_c4_temperature_curve_highlight, 
                                               aes(x = tleaf, y = a)) +
  theme(legend.position = NULL, 
        axis.title.y=element_text(size=rel(2), colour = 'black'), # change y axis title properties
        axis.title.x=element_text(size=rel(2), colour = 'black'), # change x axis title properties
        axis.text.x=element_text(size=rel(2), colour = 'black'), # change x axis text properties
        axis.text.y=element_text(size=rel(2), colour = 'black'), # change y axis text properties
        panel.background = element_rect(fill = 'white', colour = 'black'), # change background panel colors
        panel.grid.major = element_line(colour = "grey") # change backgrond color
  ) +
  geom_line(size = 5, color = 'grey') +
  geom_line(size = 4, color = 'orange', lty = 3, aes(y = aj)) +
  geom_line(size = 4, color = 'blue', lty = 3, aes(y = ac)) +
  geom_line(size = 4, color = 'darkgreen', lty = 3, aes(y = ap)) +
  ylim(c(0, 60)) +
  ylab(expression('Photosynthesis (µmol m' ^ '-2' * ' s' ^ '-1' *')')) +
  xlab(expression('Leaf Temperature (°C)'))

#### aj light response
collatz_c4_light_plot_aj = ggplot(data = collatz_c4_light_curve_lowco2, 
                                  aes(x = par, y = aj)) +
  theme(legend.position = NULL, 
        axis.title.y=element_text(size=rel(2), colour = 'black'), # change y axis title properties
        axis.title.x=element_text(size=rel(2), colour = 'black'), # change x axis title properties
        axis.text.x=element_text(size=rel(2), colour = 'black'), # change x axis text properties
        axis.text.y=element_text(size=rel(2), colour = 'black'), # change y axis text properties
        panel.background = element_rect(fill = 'white', colour = 'black'), # change background panel colors
        panel.grid.major = element_line(colour = "grey") # change backgrond color
  ) +
  geom_line(size = 5, color = 'orange') +
  ylim(c(0, 100)) +
  ylab(expression('A'[j] * ' (µmol m' ^ '-2' * ' s' ^ '-1' *')')) +
  xlab(expression('PAR (µmol m' ^ '-2' * ' s' ^ '-1' *')'))

#### ac co2 response
collatz_c4_co2_plot_ac = ggplot(data = collatz_c4_co2_curve_highlight, 
                                aes(x = ca, y = ac)) +
  theme(legend.position = NULL, 
        axis.title.y=element_text(size=rel(2), colour = 'black'), # change y axis title properties
        axis.title.x=element_text(size=rel(2), colour = 'black'), # change x axis title properties
        axis.text.x=element_text(size=rel(2), colour = 'black'), # change x axis text properties
        axis.text.y=element_text(size=rel(2), colour = 'black'), # change y axis text properties
        panel.background = element_rect(fill = 'white', colour = 'black'), # change background panel colors
        panel.grid.major = element_line(colour = "grey") # change backgrond color
  ) +
  geom_line(size = 5, color = 'blue') +
  ylim(c(0, 60)) +
  ylab(expression('A'[c] * ' (µmol m' ^ '-2' * ' s' ^ '-1' *')')) +
  xlab(expression('Atm. CO'[2] * ' (µmol mol' ^ '-1' * ')'))

#### ap co2 response
collatz_c4_co2_plot_ap = ggplot(data = collatz_c4_co2_curve_highlight, 
                                aes(x = ca, y = ap)) +
  theme(legend.position = NULL, 
        axis.title.y=element_text(size=rel(2), colour = 'black'), # change y axis title properties
        axis.title.x=element_text(size=rel(2), colour = 'black'), # change x axis title properties
        axis.text.x=element_text(size=rel(2), colour = 'black'), # change x axis text properties
        axis.text.y=element_text(size=rel(2), colour = 'black'), # change y axis text properties
        panel.background = element_rect(fill = 'white', colour = 'black'), # change background panel colors
        panel.grid.major = element_line(colour = "grey") # change backgrond color
  ) +
  geom_line(size = 5, color = 'darkgreen') +
  ylim(c(0, 400)) +
  ylab(expression('A'[p] * ' (µmol m' ^ '-2' * ' s' ^ '-1' *')')) +
  xlab(expression('Atm. CO'[2] * ' (µmol mol' ^ '-1' * ')'))

### parameter sensitivity test
collatz_c4_light_curve1 = calc_c4_photosynthesis(par = seq(10, 2000, 10), ca = 400, func = 'collatz',
                                                 vcmax_ref = rnorm(1, 39, 18.5), vpmax_ref = rnorm(1, 0.78, 0.39),
                                                 q_yield = rnorm(1, 0.066, 0.033))
collatz_c4_light_curve2 = calc_c4_photosynthesis(par = seq(10, 2000, 10), ca = 400, func = 'collatz',
                                                 vcmax_ref = rnorm(1, 39, 18.5), vpmax_ref = rnorm(1, 0.78, 0.39),
                                                 q_yield = rnorm(1, 0.066, 0.033))
collatz_c4_light_curve3 = calc_c4_photosynthesis(par = seq(10, 2000, 10), ca = 400, func = 'collatz',
                                                 vcmax_ref = rnorm(1, 39, 18.5), vpmax_ref = rnorm(1, 0.78, 0.39),
                                                 q_yield = rnorm(1, 0.066, 0.033))
collatz_c4_light_curve4 = calc_c4_photosynthesis(par = seq(10, 2000, 10), ca = 400, func = 'collatz',
                                                 vcmax_ref = rnorm(1, 39, 18.5), vpmax_ref = rnorm(1, 0.78, 0.39),
                                                 q_yield = rnorm(1, 0.066, 0.033))
collatz_c4_light_curve5 = calc_c4_photosynthesis(par = seq(10, 2000, 10), ca = 400, func = 'collatz',
                                                 vcmax_ref = rnorm(1, 39, 18.5), vpmax_ref = rnorm(1, 0.78, 0.39),
                                                 q_yield = rnorm(1, 0.066, 0.033))
collatz_c4_light_curve6 = calc_c4_photosynthesis(par = seq(10, 2000, 10), ca = 400, func = 'collatz',
                                                 vcmax_ref = rnorm(1, 39, 18.5), vpmax_ref = rnorm(1, 0.78, 0.39),
                                                 q_yield = rnorm(1, 0.066, 0.033))
collatz_c4_light_curve7 = calc_c4_photosynthesis(par = seq(10, 2000, 10), ca = 400, func = 'collatz',
                                                 vcmax_ref = rnorm(1, 39, 18.5), vpmax_ref = rnorm(1, 0.78, 0.39),
                                                 q_yield = rnorm(1, 0.066, 0.033))
collatz_c4_light_curve8 = calc_c4_photosynthesis(par = seq(10, 2000, 10), ca = 400, func = 'collatz',
                                                 vcmax_ref = rnorm(1, 39, 18.5), vpmax_ref = rnorm(1, 0.78, 0.39),
                                                 q_yield = rnorm(1, 0.066, 0.033))
collatz_c4_light_curve9 = calc_c4_photosynthesis(par = seq(10, 2000, 10), ca = 400, func = 'collatz',
                                                 vcmax_ref = rnorm(1, 39, 18.5), vpmax_ref = rnorm(1, 0.78, 0.39),
                                                 q_yield = rnorm(1, 0.066, 0.033))
collatz_c4_light_curve10 = calc_c4_photosynthesis(par = seq(10, 2000, 10), ca = 400, func = 'collatz',
                                                 vcmax_ref = rnorm(1, 39, 18.5), vpmax_ref = rnorm(1, 0.78, 0.39),
                                                 q_yield = rnorm(1, 0.066, 0.033))

### sensitivity plot 
collatz_c4_light_sensitivity_plot = ggplot(data = collatz_c4_light_curve1, 
                                      aes(x = par, y = a)) +
  theme(legend.position = NULL, 
        axis.title.y=element_text(size=rel(2), colour = 'black'), # change y axis title properties
        axis.title.x=element_text(size=rel(2), colour = 'black'), # change x axis title properties
        axis.text.x=element_text(size=rel(2), colour = 'black'), # change x axis text properties
        axis.text.y=element_text(size=rel(2), colour = 'black'), # change y axis text properties
        panel.background = element_rect(fill = 'white', colour = 'black'), # change background panel colors
        panel.grid.major = element_line(colour = "grey") # change backgrond color
  ) +
  geom_line(size = 2, color = 'black', alpha = 0.7) +
  geom_line(size = 2, color = 'orange', alpha = 0.7, data = collatz_c4_light_curve2) +
  geom_line(size = 2, color = 'blue', alpha = 0.7, data = collatz_c4_light_curve3) +
  geom_line(size = 2, color = 'purple', alpha = 0.7, data = collatz_c4_light_curve4) +
  geom_line(size = 2, color = 'green', alpha = 0.7, data = collatz_c4_light_curve5) +
  geom_line(size = 2, color = 'darkgreen', alpha = 0.7, data = collatz_c4_light_curve6) +
  geom_line(size = 2, color = 'red', alpha = 0.7, data = collatz_c4_light_curve7) +
  geom_line(size = 2, color = 'browb', alpha = 0.7, data = collatz_c4_light_curve8) +
  geom_line(size = 2, color = 'pink', alpha = 0.7, data = collatz_c4_light_curve9) +
  geom_line(size = 2, color = 'gold', alpha = 0.7, data = collatz_c4_light_curve10) +
  ylim(c(0, 60)) +
  xlim(0, 1500) +
  ylab(expression('Photosynthesis (µmol m' ^ '-2' * ' s' ^ '-1' *')')) +
  xlab(expression('PAR (µmol m' ^ '-2' * ' s' ^ '-1' *')'))

jpeg('figures/collatz_sensitivity.jpeg', width = 8, height = 8, units = 'in', res = 600)
plot(collatz_c4_light_sensitivity_plot)
dev.off()
