#Juho Ivaska
#13.11.2017
#Some wrangling with data from: https://archive.ics.uci.edu/ml/datasets/Student+Performance
student_mat <- read.csv("C:/Users/juhoi/OneDrive/Tiedostot/Coodaushit/IODS-project/data/student-mat.csv", sep = ";")
student_por <- read.csv("C:/Users/juhoi/OneDrive/Tiedostot/Coodaushit/IODS-project/data/student-por.csv", sep = ";")
str(student_mat)
dim(student_mat)
str(student_por)
dim(student_por)
library(dplyr)
join_by <- c("school", "sex", "age", "address", "famsize", "Pstatus", "Medu", "Fedu", "Mjob", "Fjob", "reason", "nursery", "internet")
math_por <- inner_join(student_mat, student_por, by = join_by, suffix = c(".math", ".por"))
str(math_por)
dim(math_por)
#
#

alc <- select(math_por, one_of(join_by))

# columns that were not used for joining the data


notjoined_columns <- colnames(student_mat)[!colnames(student_mat) %in% join_by]

                                    for(column_name in notjoined_columns) {
                                      # select two columns from 'math_por' with the same original name
                                      two_columns <- select(math_por, starts_with(column_name))
                                      # select the first column vector of those two columns
                                      first_column <- select(two_columns, 1)[[1]]
                                      
                                      # if that first column  vector is numeric...
                                      if(is.numeric(first_column)) {
                                        # take a rounded average of each row of the two columns and
                                        # add the resulting vector to the alc data frame
                                        alc[column_name] <- round(rowMeans(two_columns))
                                      } else { # else if it's not numeric...
                                        # add the first column vector to the alc data frame
                                        alc[column_name] <- first_column
                                      }
                                    }

library(ggplot2)
#
#
#
alc <- mutate(alc, alc_use = (Dalc + Walc) / 2)

alc <- mutate(alc, high_use = alc_use > 2)

glimpse(alc)
glimpse(math_por)

write.csv(alc, file = "create_alc.R")
