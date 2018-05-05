library(readr)
Train <- read_csv("~/Desktop/U Conn/Assignments/Predictive/Project/Train_final_Dec2_Kapil.csv")

summary(Train)
hist(Train$Age)
attach(Train)
table(target,Age)


train1<-subset(Train,Train$Age<18)
train1$Age_bucket<-"<18"
train2<-subset(Train,Train$Age>=18 & Train$Age<=27)
train2$Age_bucket<-"18-27"
train3<-subset(Train,Train$Age>=28 & Train$Age<=34)
train3$Age_bucket<-"28-34"
train4<-subset(Train,Train$Age>=35 & Train$Age<=40)
train4$Age_bucket<-"35-40"
train5<-subset(Train,Train$Age>40)
train5$Age_bucket<-">40"
Train1<-rbind(train1,train2,train3,train4,train5)




train1<-subset(Train1,Train1$EngineHP<90)
train1$EngineHP_bucket<-"<90"
train2<-subset(Train1,Train1$EngineHP>=90 & Train1$EngineHP<=160)
train2$EngineHP_bucket<-"90-160"
train3<-subset(Train1,Train1$EngineHP>=161 & Train1$EngineHP<=350)
train3$EngineHP_bucket<-"161-350"
train4<-subset(Train1,Train1$EngineHP>=351)
train4$EngineHP_bucket<-">350"

Train1<-rbind(train1,train2,train3,train4)




train1<-subset(Train1,Train1$Years_Experience<3)
train1$Years_Experience_bucket<-"<3"
train2<-subset(Train1,Train1$Years_Experience>=3 & Train1$Years_Experience<=8)
train2$Years_Experience_bucket<-"3-8"
train3<-subset(Train1,Train1$Years_Experience>=9 & Train1$Years_Experience<=14)
train3$Years_Experience_bucket<-"9-14"
train4<-subset(Train1,Train1$Years_Experience>=15 & Train1$Years_Experience<=30)
train4$Years_Experience_bucket<-"15-30"
train5<-subset(Train1,Train1$Years_Experience>30)
train5$Years_Experience_bucket<-">30"
Train1<-rbind(train1,train2,train3,train4,train5)







train1<-subset(Train1,Train1$Miles_driven_annually<15000)
train1$Miles_driven_annually_bucket<-"<15k"
train2<-subset(Train1,Train1$Miles_driven_annually>=15000 & Train1$Miles_driven_annually<=25000)
train2$Miles_driven_annually_bucket<-"15k-25k"
train3<-subset(Train1,Train1$Miles_driven_annually>25000)
train3$Miles_driven_annually_bucket<-">25k"
train4<-subset(Train1,is.na(Train1$Miles_driven_annually)==1)
train4$Miles_driven_annually_bucket<-"NA"

Train1<-rbind(train1,train2,train3,train4)




train1<-subset(Train1,Train1$credit_history<580)
train1$credit_history_bucket<-"Very Poor"
train2<-subset(Train1,Train1$credit_history>=580 & Train1$credit_history<=669)
train2$credit_history_bucket<-"Fair"
train3<-subset(Train1,Train1$credit_history>=670 & Train1$credit_history<=739)
train3$credit_history_bucket<-"Good"
train4<-subset(Train1,Train1$credit_history>=740 & Train1$credit_history<=799)
train4$credit_history_bucket<-"Very Good"
train5<-subset(Train1,Train1$credit_history>=800)
train5$credit_history_bucket<-"Exceptional"

Train1<-rbind(train1,train2,train3,train4,train5)



summary(Train)


write.csv(Train1,"/Users/kapil/Desktop/U Conn/Assignments/Predictive/Project/Train_bucket_kapil.csv")
