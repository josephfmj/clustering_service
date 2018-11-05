library(rjson)
library(cluster)
testVar <- NULL
# data("USArrests")
# hc <- hclust(dist(USArrests), "ave")
# ha <- agnes(dist(USArrests),diss = TRUE, method = "average")
# da <- diana(dist(USArrests),diss = TRUE)
# print(ha[["order.lab"]])
# ca <- cutree(ha,6)
# caa <- cutree(as.hclust(ha),6)
# daa <- cutree(as.hclust(da),6)
# table(ca)
# table(caa)
# table(daa)
# print(toJSON(ca))
# print(toJSON(caa))
# print(toJSON(daa))
# ct <- cutree(hc,6)
# table(ct)
# print(toJSON(ct))
# ## Do the same with centroid clustering and *squared* Euclidean distance,
# ## cut the tree into ten clusters and reconstruct the upper part of the
# ## tree from the cluster centers.
# hc2 <- hclust(dist(USArrests)^2, "cen")
# hcity.D  <- hclust(dist(USArrests), "ward.D") # "wrong"
# hcity.D2 <- hclust(dist(USArrests), "ward.D2")
# print(toJSON(hc))

testFunction <- function(a){
  testVar <<-a
}

