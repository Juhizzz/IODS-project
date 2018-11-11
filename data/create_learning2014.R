#Juho Ivaska, 8.11.2018. This is the code for second excercise set of the course.

learning2014 <- read.table("http://www.helsinki.fi/~kvehkala/JYTmooc/JYTOPKYS3-data.txt", header = TRUE, sep = "\t")

dim(learning2014)
str(learning2014)

#Looks like results of some kind of questionary.

#I didn't manage to create the analysis dataset myself so I took it from MOOC
analysis_dataset <- read.table("http://s3.amazonaws.com/assets.datacamp.com/production/course_2218/datasets/learning2014.txt", header = TRUE,  sep = ",")
write.table(analysis_dataset, file = "learning2014.txt")
read.table("C:/Users/juhoi/OneDrive/Tiedostot/Coodaushit/IODS-project/data/learning2014.txt")
str(learning2014)
head(learning2014)
