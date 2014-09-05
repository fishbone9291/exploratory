# Work directory set by the connection to Github, must post more detailed
# location information when importing data below

# List relevant packages, so their commands are recognized
library("dplyr")
library("ggplot2")
library("lubridate")
library("reshape2")

# Import data files, print and summarize
all_sizes <- read.csv("C:/Users/brian/Desktop/Masters Thesis/Data Files/all_sizes.csv", header=TRUE, sep=",")
summary(all_sizes)

# Change data types and summarize
all_sizes$age.class <- as.factor(all_sizes$age.class)
all_sizes$ID <- as.factor(all_sizes$ID)
summary(all_sizes)

# Create new variables that log-transform length and weight
all_sizes$loglength<-log(all_sizes$length)
all_sizes$logweight<-log(all_sizes$weight)

# Make some histograms
hist(all_sizes$length,main="Length Frequency",xlab="Length")
hist(all_sizes$weight,main="Weight Frequency",xlab="Weight")
hist(all_sizes$rm,main="River Mile Frequency",xlab="River Mile")

# Make some plots, delete rows with missing data if necessary
all_sizes <- na.omit(all_sizes)
summary(all_sizes)
plot(weight~length,data=all_sizes)
plot(length~rm,data=all_sizes)
plot(logweight~loglength,data=all_sizes)

# Split data by age class
# Data are in [row,column] form. Blank space after comma implies that
# you want nothing done to columns
yoy <- all_sizes[all_sizes$age.class == 0,]
yrl <- all_sizes[all_sizes$age.class == 1,]
adult <- all_sizes[all_sizes$age.class == 2,]

# Can also create a function and call it to separate data, same as above
age.split <- function(class){
  all_sizes[all_sizes$age.class == class,]
}

yoy <- age.split(0)
yrl <- age.split(1)
adult <- age.split(2)

# Remake some histograms with split data by hitting them with a hammer
hist(age.split(0)$length,main="YOY Length Frequency",xlab="Length",breaks=seq(40,100,5))
hist(age.split(1)$length,main="Yearling Length Frequency",xlab="Length",breaks=seq(90,120,5))
hist(adult$length,main="Adult Length Frequency",xlab="Length",breaks=seq(120,300,10))

hist(yoy$weight,main="YOY Weight Frequency",xlab="Weight",breaks=seq(0,10,1))
hist(yrl$weight,main="Yearling Weight Frequency",xlab="Weight")
hist(adult$weight,main="Adult Weight Frequency",xlab="Weight",breaks=seq(25,350,25))

hist(yoy$rm,main="YOY River Mile Frequency",xlab="River Mile",breaks=seq(0,150,10))
hist(yrl$rm,main="Yearling River Mile Frequency",xlab="River Mile",breaks=seq(0,150,10))
hist(adult$rm,main="Adult River Mile Frequency",xlab="River Mile",breaks=seq(0,150,10))

# Remake some plots with split data by hitting them with a hammer
plot(weight~length,data=yoy,main="YOY Weight vs Length")
plot(weight~length,data=yrl,main="Yearling Weight vs Length")
plot(weight~length,data=adult,main="Adult Weight vs Length")

plot(length~rm,data=yoy,main="YOY Length vs River Mile")
plot(length~rm,data=yrl,main="Yrl Length vs River Mile")
plot(length~rm,data=adult,main="Adt Length vs River Mile")

plot(logweight~loglength,data=yoy,main="YOY loglog")
plot(logweight~loglength,data=yrl,main="Yrl loglog")
plot(logweight~loglength,data=adult,main="Adt loglog")

# Or, make multiple summarizing plots simultaneously using ggplot
# Holy crap!
ggplot(all_sizes) + geom_histogram(aes(x=length), binwidth = 10) + facet_wrap(~age.class + site)
