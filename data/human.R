#2
hd <- read.csv("http://s3.amazonaws.com/assets.datacamp.com/production/course_2218/datasets/human_development.csv", stringsAsFactors = F)
gii <- read.csv("http://s3.amazonaws.com/assets.datacamp.com/production/course_2218/datasets/gender_inequality.csv", stringsAsFactors = F, na.strings = "..")
#
#3.
str(hd)
dim(hd)
str(gii)
dim(gii)
summary(hd)
summary(gii)
#4.
colnames(hd)[3] <- "HDI"
colnames(hd)[4] <- "LifeExp"
colnames(hd)[5] <- "EdYears"
colnames(hd)[5] <- "EdExp"
colnames(hd)[6] <- "EdMean"
colnames(hd)[7] <- "GNI"
colnames(hd)[8] <- "GNIpc"
colnames(gii)[3] <- "GII"
colnames(gii)[4] <- "MatMor"
colnames(gii)[5] <- "AdoBirth"
colnames(gii)[6] <- "WomenInParl"
colnames(gii)[7] <- "SecEdF"
colnames(gii)[8] <- "SecEdM"
colnames(gii)[9] <- "LabourF"
colnames(gii)[10] <- "LabourM"
#
#5
library(dplyr); library(ggplot2)
gii <- mutate(gii, SecEdratio = SecEdF/SecEdM)
gii <- mutate(gii, LabourRatio = LabourF/LabourM)
#
human <- inner_join(hd, gii)
colnames(human)
#
#
# Here starts excersices of week 5
#
#
names(human)
summary(human)
str(human)
#more info on the variables can be found here: http://hdr.undp.org/en/content/human-development-index-hdi
#
#1.
library(dplyr)
library(stringr)
?mutate
?mutate_each
human <- mutate(human, GNI = as.numeric(human$GNI))

#2.
keep <- c("Country", "Edu2.FM", "Labo.FM", "Life.Exp", "Edu.Exp", "GNI", "Mat.Mor", "Ado.Birth", "Parli.F")
human <- select(human, one_of(keep))
#3.
human_ <- filter(human, TRUE)
