# TR_ACSexercise
Manipulating and summarizing a subset of the 2019 ACS 1-Year PUMS

(Originally created for Tech Rebalanced 2021)

Today we will be exploring how we can use microdata to answer a question that we can't answer using a Census summary data. We will be using a portion of the [CEPRdata](https://ceprdata.org/) extract of the 2019 1-Year American Community Survey (ACS) Public Use Microdata Sample (PUMS). To keep the file from being unwieldy, the sample has been restricted to respondents from Maryland, Virginia, and the District of Columbia. Download the data [here](https://ceprdata.org/wp-content/acs/data/cepr_acs_2019_dmv.csv.zip).

Our goal today is to learn more about how workers age 50 and older get to work in these three states. Specifically, we want to know how public transit commuting breaks down by race/ ethnicity for these workers. To know this, we will need to create reshape the data to suit our needs. We will then need to cross-tabulate public transit commuting by race/ethicity for workers age 50 and older. The program file in this repository demonstrates how to use R to get this information.
