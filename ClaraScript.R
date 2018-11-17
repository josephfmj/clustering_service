#' Cargar librerias
library(cluster)
library(RJSONIO)

#' Data frame sin escalar vacio
df <- NULL
#' Numero de clusters
clusters <- NULL
#' Bandera que indica si se eescala o estandariza el data frame
standardized  <- NULL
#' Numero de muestras
samples <- NULL
#' Bandera fase swap
swapPhase <- NULL
#' Metodo de distacia
distanceMeasure <- NULL

#' Funcion para asignar los valores de las variables
#'
#' @param clusters el numero de clusters a identificar
#' @param standardized bandera que indica si estandariza el data frame
#' @param samples el numero demuestras
#' @param swapPhase bandera que indica si se ejecuta fase swap
#' @param distanceMeasure media de distancia
#'
#'
asignarVariables <- function(clusters, standardized, samples, swapPhase , distanceMeasure){ 
  
  clusters <<- clusters;
  standardized <<- standardized;
  samples <<- samples;
  swapPhase <<- swapPhase;
  distanceMeasure <<- distanceMeasure;
  
}


#' Funcion para ejecutar el algorimo CLARA con los valores de las variables
#' y el data frame dado, retorna un objeto de tipo json
#'
#' @return objeto json con los resultados de la ejecucion de CLARA
#'
#'
ejecutarClara <- function(){
  
  medoidsKey <- "medoids";
  clustersKey <- "clusters";
  lista <- list();
  
  resultado <- clara(df, K = clusters, metric = distanceMeasure, stand = standardized, samples = samples, pamLike = swapPhase);
  lista[[ medoidsKey ]] <- resultado$medoids;
  lista[[ clustersKey ]] <- resultado$clustering;
  
  return (toJSON(lista));
  
}