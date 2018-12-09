BPRS <- read.table("https://raw.githubusercontent.com/KimmoVehkalahti/MABS/master/Examples/data/BPRS.txt", header = TRUE, sep = " ")
RATS <- read.table("https://raw.githubusercontent.com/KimmoVehkalahti/MABS/master/Examples/data/rats.txt", header = T, sep = "\t")
names(BPRS)
names(RATS)
str(BPRS)
str(RATS)
dim(BPRS)
dim(RATS)
# I know understand the structure of the datasets
#
#2.
library(dplyr)
library(tidyr)
BPRS$treatment <- factor(BPRS$treatment)
BPRS$subject <- factor(BPRS$subject)
BPRS$week0 <- factor(BPRS$week0)
BPRS$week1 <- factor(BPRS$week1)
BPRS$week2 <- factor(BPRS$week2)
BPRS$week3 <- factor(BPRS$week3)
BPRS$week4 <- factor(BPRS$week4)
BPRS$week5 <- factor(BPRS$week5)
BPRS$week6 <- factor(BPRS$week6)
BPRS$week7 <- factor(BPRS$week7)
BPRS$week8 <- factor(BPRS$week8)
#
RATS$ID <- factor(RATS$ID)
RATS$Group <- factor(RATS$Group)
RATS$WD1 <- factor(RATS$WD1)
RATS$WD22 <- factor(RATS$WD22)
RATS$WD8 <- factor(RATS$WD8)
RATS$WD15 <- factor(RATS$WD15)
RATS$WD29 <- factor(RATS$WD29)
RATS$WD36 <- factor(RATS$WD36)
RATS$WD43 <- factor(RATS$WD43)
RATS$WD44 <- factor(RATS$WD44)
RATS$WD50 <- factor(RATS$WD50)
RATS$WD57 <- factor(RATS$WD57)
RATS$WD64 <- factor(RATS$WD64)
#3.
# 3. Wide to long
BPRSL <- BPRS %>%
  gather(week, BPRS, week0:week8)
#
RATSL <- RATS %>%
  gather(Time, Weight, WD1:WD64)
#
#
# 4. Comparing the wide and long
names(BPRSL)
names(RATSL)

str(BPRSL)
str(RATSL)

summary(BPRSL)
summary(RATSL)

# In the "long", the variables are individually arranged to their own columns. This is also called
# the tidy data form, a standard method used to arrange data before analysing it.

write.csv(BPRSL, "BPRSL.csv")
write.csv(RATSL, "RATS.csv")


