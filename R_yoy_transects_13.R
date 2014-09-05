# Work directory set by the connection to Github, must post more detailed
# location information when importing data below

# List relevant packages, so their commands are recognized
library("dplyr")
library("ggplot2")
library("lubridate")
library("reshape2")
library("methods")

# Import data files, print and summarize
transects <- read.csv("C:/Users/brian/Desktop/Masters Thesis/Data Files/yoy_transects_13.csv", header=TRUE, sep=",")
summary(transects)

# Change data types and summarize
transects$id <- as.factor(transects$id)
transects$point <- as.factor(transects$point)
summary(transects)

# Make a new variable for Sr:ca
transects$srca<-(((transects$sr)*1000)/(transects$ca))

# Make some plots
interaction.plot()
