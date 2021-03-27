# TR_ACSexercise
Manipulating and summarizing a subset of the 2019 ACS 1-Year PUMS

(Originally created for Tech Rebalanced 2021)

In this exercise, we will be exploring how we can use microdata to answer a question that we can't answer using a Census summary table (specifically, [Table S0802](https://data.census.gov/cedsci/table?q=ACSST1Y2019.S0802&t=Commuting&g=0400000US11,24,51&y=2019&tid=ACSST1Y2019.S0802&moe=false&hidePreview=true)). We will be using a portion of the [CEPRdata](https://ceprdata.org/) extract of the 2019 1-Year American Community Survey (ACS) Public Use Microdata Sample (PUMS). To keep the file from being unwieldy, the sample has been restricted to respondents from Maryland, Virginia, and the District of Columbia. Download the data [here](https://ceprdata.org/wp-content/acs/data/cepr_acs_2019_dmv.csv.zip).

Our goal is to learn more about how workers age 50 and older commute to work in our area. Specifically, we want to know how public transit commuting breaks down by race/ ethnicity for workers in this age group. To assess this, we will need to reconfigure the data to suit our needs. We will then need to cross-tabulate public transit commuting by race/ethicity for workers age 50 and older. The program file in this repository demonstrates how to use R to do this.

