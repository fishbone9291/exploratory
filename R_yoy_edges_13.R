# Work directory set by the connection to Github, must post more detailed
# location information when importing data below

# List relevant packages, so their commands are recognized
library("dplyr")
library("ggplot2")
library("lubridate")
library("reshape2")
library("methods")

# Import data files, print and summarize
edges <- read.csv("C:/Users/brian/Desktop/Masters Thesis/Data Files/yoy_edges_13.csv", header=TRUE, sep=",")
summary(edges)

# Change data types and summarize
edges$id <- as.factor(edges$id)
summary(edges)

# Make a new variable for Sr:ca
edges$srca <- (((edges$sr)*1000)/(edges$ca))

# Make a pivot table, so we can display mean Sr:Ca and salinity. 
# Make it a new data frame.

