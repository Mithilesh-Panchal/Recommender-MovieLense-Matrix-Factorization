require(recommenderlab)
require(base)
data("MovieLense")
data<-MovieLense
data<-as(data,"matrix")
R<-data[1:200,]

#Taking K=15
P<-matrix(nrow = 200,ncol =15)
Q<-matrix(nrow = 1664,ncol =15)
err<-matrix(nrow =200, ncol =1664)

#Taking alpha=0.0001 and beta=0.002
alpha=0.0001
beta=0.002

#Transpose of a Matrix
QT<-t(Q)

#Matrix Multiplication
PR<-P %*% QT

#Initializing Matrix P
for(i in 1:200){
  for(j in 1:15){
    x<-runif(1,0.258,0.583)
    P[i,j]<-x
  }
}

#Initializing Matrix Q
for(i in 1:1664){
  for(j in 1:15){
    x<-runif(1,0.258,0.583)
    Q[i,j]<-x
  }
}

QT<-t(Q)
PR <- P %*% QT

#Main Algorithm
for(step in 1:100){
  avgerr<-0
  count<-0
    for(i in 1:200){
    for(j in 1:1664){
      if(!is.na(R[i,j])){
        err[i,j]<- R[i,j] - PR[i,j]
          for(k in 1:15){
            P[i,k]<-P[i,k] + alpha*(err[i,j]*QT[k,j]-beta*P[i,k])
            QT[k,j]<-QT[k,j] + alpha*(err[i,j]*P[i,k]-beta*QT[k,j])
          }
      }
    }
  }
  PR <- P %*% QT
}


diff<-R-PR
count<-0
mae<-0
for(m in 1:200){
   for(n in 1:1664){
    if(identical(is.na(diff[m,n]),FALSE)){
      mae<- mae + abs(diff[m,n])
      count<-count+1
    }
  }
}
mae<-mae/count
mae

tp<-0
fp<-0
tn<-0
fn<-0

for(i in 1:200){
  for(j in 1:1664){
    if(!is.na(R[i,j])==TRUE){
      if(R[i,j]>=3&&PR[i,j]>=3){
        tp<-tp+1
      }
      if(R[i,j]>=3&&PR[i,j]<3){
        fn<-fn+1
      }
      if(R[i,j]<3&&PR[i,j]>=3){
        fp<-fp+1
      }
      if(R[i,j]<3&&PR[i,j]<3){
        tn<-tn+1
      }
    }
  }
}

precision<-tp/(tp+fp)
recall<-tp/(tp+fn)
f1<-2*(precision*recall)/(precision+recall)
