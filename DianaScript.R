#' Cargar librerias
library(cluster)
library(RJSONIO)

#' Data frame sin escalar vacio
df <- NULL
#' Numero de clusters
clusters <- NULL
#' Metodo de distacia
distanceMeasure <- NULL

#' Funcion para asignar los valores de las variables
#'
#' @param clusters el numero de clusters a identificar
#' @param distanceMeasure media de distancia
#'
#'
asignarVariables <- function(clusters, distanceMeasure){ 
  
  distanceMeasure <<- distanceMeasure;
  clusters <<- clusters;
  
}


#' Funcion para ejecutar el algorimo DIANA con los valores de las variables
#' y el data frame dado, retorna un objeto de tipo json
#'
#' @return objeto json con los resultados de la ejecucion de DIANA
#'
#'
ejecutarDiana <- function(){
  
  clustersKey <- "clusters";
  lista <- list();
  resultado <- diana(dist(df,method = distanceMeasure));
  lista[[key]] <- cutree(as.hclust(resultado),k = clusters);
  
  return (toJSON(lista));
  
}