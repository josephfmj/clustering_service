#' Cargar librerias
library(cluster)
library(RJSONIO)

#' Data frame sin escalar vacio
df <- NULL
#' Numero de clusters
clusters <- NULL
#' Bandera fase swap
swapPhase <- NULL
#' Metodo de distacia
distanceMeasure <- NULL


#' Funcion para asignar los valores de las variables
#'
#' @param clusters el numero de clusters a identificar
#' @param swapPhase bandera que indica si se ejecuta fase swap
#' @param distanceMeasure media de distancia
#'
#'
asignarVariables <- function(clusters, swapPhase , distanceMeasure){ 
  
  distanceMeasure <<- distanceMeasure;
  clusters <<- clusters;
  swapPhase <<- swapPhase;
  
}


#' Funcion para ejecutar el algorimo PAM con los valores de las variables
#' y el data frame dado, retorna un objeto de tipo json
#'
#' @return objeto json con los resultados de la ejecucion de PAM
#'
#'
ejecutarPam <- function(){
  
  medoidsKey <- "medoids";
  clustersKey <- "clusters";
  lista <- list();
  
  resultado <- pam(dist(df, method = distanceMeasure),k = clusters,do.swap = swapPhase);
  lista[[ medoidsKey ]] <- resultado$medoids;
  lista[[ clustersKey ]] <- resultado$clustering;
  
  return (toJSON(lista));
  
}