library(readr)
train <- read_csv("~/Desktop/Hackathon/train 2.csv")
View(train)

library(readxl)
test_excel <- read_excel("~/Desktop/Hackathon/test_excel.xlsx")
View(test_excel)


## Creating Column for important city
train$City_Category1<-0
train$City_Category1[train$City_Category=="A"]<-1

test_excel$City_Category1<-0
test_excel$City_Category1[test_excel$City_Category=="A"]<-1


## Creating Column for Important city code

unique(train$City_Code)
train$City_Code1<-0
train$City_Code1[train$City_Code=="C10001"]<-1
train$City_Code1[train$City_Code=="C10002"]<-1
train$City_Code1[train$City_Code=="C10003"]<-1
train$City_Code1[train$City_Code=="C10004"]<-1
train$City_Code1[train$City_Code=="C10005"]<-1
train$City_Code1[train$City_Code=="C10006"]<-1
train$City_Code1[train$City_Code=="C10007"]<-1
train$City_Code1[train$City_Code=="C10008"]<-1
train$City_Code1[train$City_Code=="C10009"]<-1
train$City_Code1[train$City_Code=="C10010"]<-1

table(train$City_Code1)


test_excel$City_Code1<-0
test_excel$City_Code1[test_excel$City_Code=="C10001"]<-1
test_excel$City_Code1[test_excel$City_Code=="C10002"]<-1
test_excel$City_Code1[test_excel$City_Code=="C10003"]<-1
test_excel$City_Code1[test_excel$City_Code=="C10004"]<-1
test_excel$City_Code1[test_excel$City_Code=="C10005"]<-1
test_excel$City_Code1[test_excel$City_Code=="C10006"]<-1
test_excel$City_Code1[test_excel$City_Code=="C10007"]<-1
test_excel$City_Code1[test_excel$City_Code=="C10008"]<-1
test_excel$City_Code1[test_excel$City_Code=="C10009"]<-1
test_excel$City_Code1[test_excel$City_Code=="C10010"]<-1

table(test_excel$City_Code1)


## Creating Column for Important city code

train$Employer_Category2_1<-0
train$Employer_Category2_1[train$Employer_Category2==4]<-1
table(train$Employer_Category2_1)

test_excel$Employer_Category2_1<-0
test_excel$Employer_Category2_1[test_excel$Employer_Category2==4]<-1
table(test_excel$Employer_Category2_1)


## Creating Column for Important source category
train$Source_Category_1<-0
train$Source_Category_1[train$Source_Category=="B"]<-1
train$Source_Category_1[train$Source_Category=="G"]<-1

table(train$Source_Category_1)

test_excel$Source_Category_1<-0
test_excel$Source_Category_1[test_excel$Source_Category=="B"]<-1
test_excel$Source_Category_1[test_excel$Source_Category=="G"]<-1

table(test_excel$Source_Category_1)

## Creating Column for Important source category

unique(train$Source)
train$Source_1<-0
train$Source_1[train$Source=="S122"]<-1
train$Source_1[train$Source=="S133"]<-1
table(train$Source_1)

test_excel$Source_1<-0
test_excel$Source_1[test_excel$Source=="S122"]<-1
test_excel$Source_1[test_excel$Source=="S133"]<-1
table(test_excel$Source_1)

## Creating Column for Important var1 category
train$Var1_1<-0
train$Var1_1[train$Var1==7]<-1
train$Var1_1[train$Var1==10]<-1
table(train$Var1_1)

test_excel$Var1_1<-0
test_excel$Var1_1[test_excel$Var1==7]<-1
test_excel$Var1_1[test_excel$Var1==10]<-1
table(test_excel$Var1_1)

colnames(train)
colnames(test_excel)

write.csv(test_excel,"/Users/kapil/Desktop/test_0239.csv")
write.csv(train,"/Users/kapil/Desktop/train_0239.csv")


table(train$Contacted)
table(test_excel$Contacted)
