fClean.pre.rbind <- function(this.list){
  
  l1 <- this.list[str_which(names(this.list), 'Topp 40')]
  l1.c <- lapply(l1, fClean.pre.rbind.top40)
  
  l2 <- this.list[str_which(names(this.list), 'Aðsóknartölur fyrir')]
  l2.c <- lapply(l2, fClean.pre.rbind.adsoknartolur)
  
  return(c(l1.c, l2.c))
}