#conduct PCA model
pcamodel <- prcomp(pcadata, scale = TRUE) #pcadata is the data you want conduct PCA
summary(pcamodel)

#observe PCA model
plot(pcamodel, main = "", col="green")

#observe PC scores
pcamodel$x[,1:15]

#construct a dataframe that contains 15 principle components with cumulative proportion of variance equal to 70%
df_pcscores <- pcamodel$x[,1:15]
dim(df_pcscores)

#eigenvalue
eig.val <- get_eigenvalue(pcamodel)
eig.val
