### final cut and extraction
fExtract.table <- function(cleaned.list, selection = 1){
  
  if(selection == 1){
    l1 <- cleaned.list[str_which(names(cleaned.list), 'Topp 40')]
    t1 <- do.call(rbind, l1)
    t1$info <- str_replace(row.names(t1), '\\.[:digit:]+', '')
    
    t1 <- t1 %>% as_tibble() %>%
      mutate(year = str_extract(.$info, '[:digit:][:digit:][:digit:][:digit:]')) %>%
      select(year, film_rank, film_title, distributor_name,
             gross_box_o, admittance)
    return(t1)
    
  } else {
    l2 <- cleaned.list[str_which(names(cleaned.list), 'Aðsóknartölur fyrir')]
    t2 <- do.call(rbind, l2)
    t2$info <- str_replace(row.names(t2),  '\\.[:digit:]+', '')
    
    t2 <- t2 %>% as_tibble() %>%
      mutate(year = str_extract(.$info, '[:digit:][:digit:][:digit:][:digit:]')) %>%
      select(year, film_rank, film_title, footnote,
             gross_box_o, admittance)
    return(t2)
  }
}