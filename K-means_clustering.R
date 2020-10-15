------Clustering tendency - clusterable or not?------

#test the clustering tendency for df_pcscores
get_clust_tendency(df_pcscores, n = 1000, graph = FALSE)


------Partitioning (K-means) clustering------

pairs(df_pcscores)

set.seed(123)
km.df_pcscores <- kmeans(df_pcscores, 4, iter.max = 30, nstart = 25) # K=4 is determined by Elbow method

print(km.df_pcscores)

km_cluster <- km.df_pcscores$cluster

head(km_cluster)

------Relative cluster validation - determing optimal K------

#Elbow method
fviz_nbclust(df_pcscores, kmeans, method = "wss") +
    geom_vline(xintercept = 4, linetype = 2)+
  labs(subtitle = "Elbow method")
  


