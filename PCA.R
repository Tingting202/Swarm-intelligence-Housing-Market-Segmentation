------library packages------

library("cluster") 
library("factoextra") # data visualization
library("NbClust") # determining the optimal number of clusters in the data se
library("fpc") # computing clustering validation statistics

------PCA to reduce data dimension------

pcamodel <- prcomp(pcadata, scale = TRUE) #pcadata is the data you want conduct PCA
summary(pcamodel)

plot(pcamodel, main = "", col="green")

pcamodel$x[,1:15]

#construct a dataframe that contains 15 principle components with cumulative proportion of variance equal to 70%
df_pcscores <- pcamodel$x[,1:15]
dim(df_pcscores)

eig.val <- get_eigenvalue(pcamodel)
eig.val
