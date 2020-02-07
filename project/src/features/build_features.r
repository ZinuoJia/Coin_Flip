library("data.table")
library(DataComputing)

readDir = "./project/volume/data/raw"
writeDir = "./project/volume/data/processed"
exterDir = "./project/volume/data/external"
interDir = "./project/volume/data/interim"


#read data into environment
train = fread(file = file.path(readDir,"train_file.csv"))
test = fread(file = file.path(readDir,"test_file.csv"))
#delet column "id"
train <-
  train%>%
  select(2:12)


