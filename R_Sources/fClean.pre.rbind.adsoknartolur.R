## pre clean aðsóknartölur
## needed to hack around some oddities in the data
fClean.pre.rbind.adsoknartolur <- function(df){
  
  if(ncol(df) > 3){
    df <- df[, c(1,3,4)]
  }
  
  names(df) <- c('film_title', 'gross_box_o', 'admittance')
  
  df <- df %>% mutate(
    film_rank = dplyr::row_number(),
    film_title = str_replace_all(.$film_title, '\\n|\\r', '') %>%
      str_replace_all('  ', ' '),
    gross_box_o = str_replace_all(.$gross_box_o, '\\.|,', '') %>%
      str_extract('[:digit:]*') %>%
      as.integer(),
    admittance = str_replace_all(.$admittance, '\\.|,', '') %>%
      str_extract('[:digit:]*') %>%
      as.integer()
  )
  
  df$footnote <- character(nrow(df))
  targets <- str_which(df$film_title, '.*\\*+$')
  if(length(targets)>0){
    df$footnote[targets] <- 
      str_extract(df$film_title[targets], '\\*+')
  }
  df$film_title <- str_replace(df$film_title, '\\*+', '')
  
  df <- df %>% filter(film_title != 'SAMTALS:')
  
  return(df)
}
