
################~~ RESBAZ 2021 ~~############~~ Intro to R and RStudio ~~#######

## created by Laura Duntsch
## University of Auckland


################~~
#### Demonstration 0: Open and navigate RStudio
################~~


## to open fourth panel (top left) with R script that can be saved
## File > New File > R Script

## to create new project/directory/folder for this workshop
## top right > New Project > New Directory > New Project > Give Name > Create Project
## a project can be treated just like any other folder on your computer 
## (e.g. you can add files to it, such as .csv)


################~~
#### Demonstration 1
################~~


#### Demonstration 1: Your RStudio project
## type into console (bottom left) to get your working directory:
getwd()  


# Two ways of running a code:
 # i. in the console (bottom left)
 # ii. in the R script (you can save this!)
# Give both a try!

# To save script: File > Save > name_of_script.R
# Shortcut: Ctrl + S
# To run code in your script, click  "Run" bottom up in the right corner
# Shortcut: Ctrl + Enter

  
#### Demonstration 1: Comments vs code
## this is a comment, but in the line below that's code
getwd()                                             
# getwd() stands for get your working directory     


#### Demonstration 1: Data types
class("Anna")
# [1] "character"
class(2021)
# [1] "numeric"


#### Demonstration 1: Creating objects
## the assignment operator is the symbols <- which form an arrow (Shortcut: Alt + - (Windows) or Option + - (Mac))
my_name <- "Laura"      
my_name
# [1] "Laura"

# So now the object my_name ‘contains’ the value "Laura". Another assignment to the same object will overwrite the content:
my_name <- "Susanne"
my_name
# [1] "Susanne"


#### Demonstration 1: R functions
# Functions (or commands) perform tasks in R. An example:
seq()     ## same as "seq(from = 1, to = 1, by =1)"
# [1] 1

seq(from = 2, to = 6, by = 2)
# [1] 2 4 6 

### Run ?seq() if you want to know more about this function


########## TIME TO PRACTISE! ########## 




################~~
#### Demonstration 2
################~~


#### Demonstration 2: Installing and loading packages
install.packages("data.table")   ## install package
library(data.table)              ## load package
fread("filename.csv")            ## use function fread() on .csv file "filename.csv"

###  Access a function in a specific package
## package::functionname, e.g.
data.table::fread("filename.csv")



#### Demonstration 2: Dealing with errors

# let's make a mistake on purpose!
# if I type the following, an error appears:
gets()
# > Error in gets() : could not find function "gets"

# or
data
# > Error: object 'data' not found

## very often this is due to a spelling mistake, 
## or because previous code didn't run correctly.
## read the warning message and often you can solve the problem that way :)


########## TIME TO PRACTISE! ########## 




################~~
#### Demonstration 3
################~~


#### Demonstration 3: Reading in data from a .csv file

## get package ready that you’re likely to use in everyday data analyses:
install.packages("data.table")      # it offers a natural and flexible syntax
library(data.table)       

## one of many ways to load a data set called filename.csv into your R session:
my_data <- fread("filename.csv")
my_data
#      Name Height
# 1:   Lisa    167
# 2:    Bob    179
# 3: Cecile    180


#### Demonstration 3: View penguin data

## get package with pre-curated dataset:
install.packages("palmerpenguins")         ## contains some nice penguin data ;)

## load package:
library(palmerpenguins)

## view data set in console:
penguins

########################

head(penguins)           #shows just the "head"/top part of the data

## view data in new tab in RStudio:
View(penguins)          # allows us to to open a new tab with the data table

## Explore the penguin data: what is stored in the rows and columns?

## Moreover: I spot NA values in our data!
## NA = cells in table with no entry



#### Demonstration 3: The pipe operator %>%

##Packages we’ll need from now on:
install.packages("magrittr")   # provides the pipe operator
install.packages("tidyr")      # provides drop_na() function

library(magrittr)
library(tidyr)

## and remove the individuals with NAs (cells in table with no entry)
penguins_nafree <- penguins %>% drop_na()
penguins_nafree

## Look! All entries with NA have been removed!
## Trick: read pipe symbol as “then” or “and then”!




#### Demonstration 3: The pipe operator %>% (more complex)

# To calculate the mean bill length of each species in the penguin dataset:

install.packages("dplyr")    ## to get the summarise() function
library(dplyr)

penguins_nafree %>% 
  group_by(species) %>% 
  summarise(average_bill_length = mean(bill_length_mm))

# Code means:
# Take the penguins_nafree data, then
# Use this and apply the group_by() function to group by species, then
# Use this output and apply the summarize() function to calculate the mean (using (mean()) bill         # length (bill_length_mm) of each group (species), calling the resulting number ‘average_bill_length’.


########## TIME TO PRACTISE! ########## 




#### Demonstration 4: Creating plots in R with ggplot

# R default:
plot(penguins_nafree$flipper_length_mm,	penguins_nafree$body_mass_g)

## ggplot2:
install.packages("ggplot2")
library("ggplot2")

# scatter:
ggplot(data = penguins_nafree, aes(x=flipper_length_mm, y=body_mass_g, color=species)) +
  geom_point()

# facets:
ggplot(penguins_nafree, aes(x=flipper_length_mm, y=body_mass_g, color=species)) +
  geom_point() +
  facet_grid(island~sex )


# themes and labels:
ggplot(penguins_nafree, aes(x=flipper_length_mm, y=body_mass_g, color=species)) +
  geom_point() +
  labs(x = "Flipper length (mm)", y = "Body mass (g)", color= "Species") +
  theme_classic()



