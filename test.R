library(RJSONIO)
library(rjson)
library(cluster)
library(amap)
testVar <- NULL

data("USArrests")
km <- Kmeans(USArrests, 3, 10 , 1,"euclidean")
cla <- clara(USArrests, 3, metric = "euclidean", stand = TRUE, samples = 5, pamLike = TRUE);
pda <- pam(dist(USArrests),k=5,diss = TRUE);
#print(toJSON(pda))
# hc <- hclust(dist(USArrests), "ave")
dsf <- dist(USArrests,method = "minkowski");
ha <- agnes(dist(USArrests,method = "binary"), method = "average");
da <- diana(dist(USArrests, method = "minkowski"))
# print(ha[["order.lab"]])
ca <- cutree(as.hclust(ha),k = 6);
daa <- cutree(as.hclust(ha),k = 6);
# caa <- cutree(as.hclust(ha),6)
# daa <- cutree(as.hclust(da),6)
# table(ca)
# table(caa)
# table(daa)
agneskey <- "clusters"
mylist <- list()
mylist[[ agneskey ]] <- ca

pamkey_1 <- "medoids"
pamkey_2 <- "clusters"
mylist2 <- list()
mylist2[[ pamkey_1 ]] <- pda$medoids
mylist2[[ pamkey_2 ]] <- pda$clustering


cl <- RJSONIO::toJSON(cla$medoids,pretty = TRUE );
clp <- RJSONIO::toJSON(cla$clustering,pretty = TRUE );
ag <- RJSONIO::toJSON(mylist,pretty = TRUE );
dal <- RJSONIO::toJSON(daa,pretty = TRUE );
#md <- RJSONIO::toJSON(pda$medoids,pretty = TRUE );
#js <- RJSONIO::toJSON(pda$clustering);
js <- RJSONIO::toJSON(mylist2)
writeLines(cl);
writeLines(clp);
writeLines(ag);
writeLines(dal);
#writeLines(md);
writeLines(js);
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

