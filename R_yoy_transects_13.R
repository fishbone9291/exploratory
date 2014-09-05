# Set work directory
setwd("C:/Users/brian/Desktop/Masters Thesis/Data Files/")

# List relevant packages, so their commands are recognized
library("dplyr")
library("ggplot2")
library("date")
library("methods")

# Import data files, print and summarize
transects <- read.csv("yoy_transects_13.csv", header=TRUE, sep=",")
summary(transects)

# Change data types and summarize
transects$id <- as.factor(transects$id)
summary(transects)

# Make a new variable for Sr:ca
transects$srca<-(((transects$sr)*1000)/(transects$ca))

# Make some plots
interaction.plot()
