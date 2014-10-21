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
summary(transects)
# Will be plotting by points, so do NOT make them factors

# Make a new variable for Sr:ca
transects$srca <- (((transects$sr)*1000)/(transects$ca))

# Define information in the plot and store in object 'p' (for plot)
p <- ggplot(data = transects, aes(x = point, y = srca, group = id))
# Make some simple plots, eventually making them more complex
p + geom_point()
p + geom_line()
p + geom_line() + stat_smooth(aes(group = 1)) + 
  stat_summary(aes(group = 1), geom = "point", fun.y = mean, shape = 16, size = 3) + 
  facet_wrap(~ site)

# Remove oddball fish and re-create plot
notransects <- transects[ which(id=='50'),]
detach(notransects)

