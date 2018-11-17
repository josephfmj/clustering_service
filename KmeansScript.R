#' Cargar librerias
library(amap)
library(RJSONIO)

#' Data frame sin escalar vacio
dfv <- NULL
#' Data frame escalado
df <- NULL
#' Metodo de distacia
distanceMeasure <- NULL
#' Centros
centers <- NULL
#' Iteraciones maximas
iter_max <- NULL
#' iteracion inicial
n_start <- NULL

#' Funcion para escalar o normalizar los valores del dataframe
#' asigna el resultado de escalar el data.frame dfa en la variable df
#' 
scaleDataFrame <- function(){
  df <<- scale(dfv)
  
}

#'Funcion para asignar los valores de las variables
#'
#' @param centers los centros para el algoritmo kmeas
#' @param iter_max la iteraciones maximas
#' @param n_start iteracion inicial
#' @param distanceMeasure media de distancia
#'
#'
asignarVariables <- function(centers, iter_max , n_start,distanceMeasure){ 
 
  distanceMeasure <<- distanceMeasure
  centers <<- centers
  iter_max <<- iter_max
  n_start <<- n_start
  
}


#' Funcion para ejecutar el algorimo K-Means con los valores de las variables
#' y el data frame dado, retorna un objeto de tipo json
#' 
#' @return objeto json con los resultados de la ejecucion de K-Means
#'
ejecutarKmeans <- function(){ 
  scaleDataFrame();
  return (toJSON(Kmeans(df, centers, iter_max , n_start,distanceMeasure)));
  
}


