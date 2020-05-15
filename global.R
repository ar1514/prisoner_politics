library(shiny)
library(tidyverse)
library(lubridate)
library(readr)
library(dplyr)


prisoner_data <- read.csv('project_prisoner_data.csv')
prisoner_data <- mutate(prisoner_data,
                        'Ever voted'=as.factor(ever_voted),
                        'How often they discuss politics'=as.factor(how_often_discuss_politics),
                        'Which party is better for criminal justice reform'=as.factor(which_party_for_cj_reform),
                        'Stance on marijuana legalization'=as.factor(stance_on_marijuana_legalization),
                        'Stance on raising minimum wage'=as.factor(stance_on_raise_min_wage),
                        'Should incarcerated people vote'=as.factor(should_incarcerated_vote),
                        'Lowering incarceration rates'=as.factor(lower_incarceration),
                        'Ending private prisons'=as.factor(end_private_prisons),
                        'Age'=as.factor(age),
                        'Highest education level'=as.factor(highest_education_level),
                        'Length in prison'=as.factor(length_in_this_facility),
                        'Race'=as.factor(race),
                        'Gender'=as.factor(gender),
                        'Which political party'=as.factor(party), 
                        '2020 President'=as.factor(who_vote_for)) 


xVar <- c('2020 President', 'Ever voted', 'How often they discuss politics', 'Which party is better for criminal justice reform', 'Stance on marijuana legalization', 'Stance on raising minimum wage', 'Should incarcerated people vote', 'Lowering incarceration rates', 'Ending private prisons')
yVar <- c('Which political party', 'Age', 'Highest education level', 'Length in prison', 'Race', 'Gender')

subVar <- c('Which political party', 'Age', 'Highest education level', 'Length in prison', 'Race', 'Gender')

