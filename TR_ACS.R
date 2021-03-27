### *** Tech Rebalanced 2021 - ACS Microdata exercise *** ###
### by Hayley Brown

# set working directory
setwd("/your/path/to/your/data/")
# use backslashes if using windows
# Download the data from here: https://ceprdata.org/wp-content/acs/data/cepr_acs_2019_dmv.csv.zip
# Data documentation can be found here: 
    ## Variable names and descriptions: https://ceprdata.org/wp-content/acs/vardesc/cepr_acs_2019_varlist.log
    ## Variable value labels: https://ceprdata.org/wp-content/acs/vardesc/cepr_acs_2019_varlabels.log
    ## Stata program files used to create extracts: https://ceprdata.org/acs-uniform-data-extracts/acs-programs/
    ### Note that the documentation is for the full 2019 ACS 1-year sample, 
        #### but the data we are working with today only includes MD, DC, and VA. 
        #### The sample for the entire US is a much bigger file.


# load applicable packages
library(dplyr)
library(pollster)

# Read the data into a data frame in R, without unzipping the file
acs19dmv <- read.csv(unz("cepr_acs_2019_dmv.csv.zip", "cepr_acs_2019_dmv.csv"), header = TRUE,
                     sep = ",") 

# select the variables we actually care about for this
acs19dmv_sub <- acs19dmv %>%
  select(age,
         wbhao,
         pubtran,
         perwgt)

# create variable with different age groupings, according to race/ ethnicity
## we are ultimately looking for the cross-section of age 50+ who answered the commuting question, so baking in pubtran
acs19dmv_sub <- acs19dmv_sub %>% 
  mutate(agerace = case_when(age >= 50 & wbhao == 'White' & (pubtran == 0 | pubtran == 1) ~ 'White, age 50+', 
                             age >= 50 & wbhao == 'Black' & (pubtran == 0 | pubtran == 1) ~ 'Black, age 50+',
                             age >= 50 & wbhao == 'Hispanic' & (pubtran == 0 | pubtran == 1) ~ 'Hispanic, age 50+',
                             age >= 50 & wbhao == 'AAPI' & (pubtran == 0 | pubtran == 1) ~ 'AAPI, age 50+',
                             age >= 50 & wbhao == 'Other' & (pubtran == 0 | pubtran == 1) ~ 'Other, age 50+'))

# run some simple crosstabs
crosstab(acs19dmv_sub, pubtran, agerace, w = perwgt)

# note the missing values! if we want to compute shares, those need to go

# get rid of the missing values
acs19dmv_sub <- acs19dmv_sub[!is.na(acs19dmv_sub$agerace),]

# crosstab, excluding missing values
shares <- crosstab(acs19dmv_sub, pubtran, agerace, w = perwgt)
# note the weight - this is important! these are person level variables, so we use perwgt; 
# we would use hsgwgt for household level variables
View(shares)
