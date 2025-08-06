##~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
##                                                                            --
##---------------------- DIFFERENTIAL EQUATION PRACTICE-------------------------
##                                                                            --
##~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

#library(ARTofR)
#xxx_title1("Differential Equation Practice")

library(deSolve)
library(tidyverse)
library(ggplot2)

#create timer series to estimate numerical solution over
time_seq <- seq(from = 0, to = 0.2, by = 0.001)

#set parameter values (can change)
parameter_example <- c(lambda = 0.4, delta = 0.06)

#set initial conditions
init_cond_example <- c(C = 4.8)

#prepare differential equations as a function
df_equation_example <- function(time_seq, init_cond_example, parameter_example) {
  
  # using our initial conditions and parameter values ....
  with(as.list(c(init_cond_example, parameter_example)), {
    
    # ... estimate the numerical solutions to this differential equation....
    dCdt = lambda * C^2 - 3.1 * delta
    
    # ...and return a list of approximated solutions calculated at each time step 
    #for all equations (here we only have 1 equation that we're solving for)
    return(list(c(dCdt)))
    
  })
}

#find approximate solution numerically 
approx_df_example <- deSolve::ode(y = init_cond_example, 
                                  times = time_seq,
                                  func = df_equation_example,
                                  parms = parameter_example)

#check class
class(approx_df_example)

#convert to data frame for plotting
approx_df_example <- data.frame(approx_df_example)
class(approx_df_example)

#plot it!
ggplot(data = approx_df_example, aes(x = time, y = C)) +
  geom_point(size = 0.1)
