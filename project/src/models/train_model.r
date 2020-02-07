library("data.table")
library(DataComputing)

readDir = "./project/volume/data/raw"
writeDir = "./project/volume/data/processed"
exterDir = "./project/volume/data/external"
interDir = "./project/volume/data/interim"
modeldir <- "./project/volume/models"

#train model
model1 <-glm(result~., data = train, family = binomial)
summary(model1)

#predict and save result
test2<-
  test%>%
  mutate(result = predict(model1,newdata = test,type = "response"))%>%
  select(id,result)
fwrite(test2,file =file.path(writeDir,"coinflipPredict.csv"))
       
#save model
saveRDS(model1,file = file.path(modeldir,"coinflipmodel.rds"))


