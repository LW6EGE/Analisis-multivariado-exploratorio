#cluster para la base  VADeaths

data ("VADeaths")
library (cluster)

#distancia euclidea 
d_euclidea = daisy (VADeaths, metric = "euclidean") #el parametro metric permite modifica la distancia a utilizar 
d_euclidea

#generacion del cluster (jerarquico)

cluster_euclid = hclust (d_euclidea , method = "complete") # en este caso mediante  es mediante ligamiento completo 
cor (cophenetic(cluster_euclid), d_euclidea) #coeficiente de correlaicon cofenetica 

# dendograma (sin bilbioteca ggplot2)

plot (as.dendrogram(cluster_euclid) , horiz=T) # en este caso en posicion horizontal.

# dendograma (con bilioteca ggplot2)

library (ggplot2)
library (ggdendro)

ggdendrogram (cluster_euclid, rotate = T) + scale_y_reverse() 

# generando cluster no jerarquico (k-means)

cluster_k_means = kmeans(d_euclidea ,3 ) #utilizando la matriz de dist euclidea con 3 centroides

cluster_k_means$cluster # separacion por cluster 
cluster_k_means$centers #centroides 
library(factoextra)

fviz_cluster(cluster_k_means, data = VADeaths) #grafica de cluster 
