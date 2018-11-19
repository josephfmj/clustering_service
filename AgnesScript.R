#' Cargar librerias
library(cluster)
library(RJSONIO)

#' Data frame sin escalar vacio
df <- NULL
#' Numero de clusters
clusters <- NULL
#' Metodo de clustering
clusteringMethod <- NULL
#' Metodo de distacia
distanceMeasure <- NULL

#' Funcion para asignar los valores de las variables
#'
#' @param clusters el numero de clusters a identificar
#' @param clusteringMethod metodo de clustering
#' @param distanceMeasure media de distancia
#'
#'
asignarVariables <- function(clusters, clusteringMethod , distanceMeasure){ 
  
  distanceMeasure <<- distanceMeasure;
  clusters <<- clusters;
  clusteringMethod <<- clusteringMethod;
  
}


#' Funcion para ejecutar el algorimo AGNES con los valores de las variables
#' y el data frame dado, retorna un objeto de tipo json
#'
#' @return objeto json con los resultados de la ejecucion de AGNES
#'
#'
ejecutarAgnes <- function(){
  
  clustersKey <- "clusters";
  lista <- list();
  resultado <- agnes(dist(df,method = distanceMeasure), method = clusteringMethod);
  lista[[clustersKey]] <- cutree(as.hclust(resultado),k = clusters);
  
  return (toJSON(lista));
  
}