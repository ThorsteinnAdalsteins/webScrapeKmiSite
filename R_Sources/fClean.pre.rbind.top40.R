# fClean.pre.rbind.top40
# simple table form for the top40 table
fClean.pre.rbind.top40 <- function(df){
  names(df) <- c('film_title', 'distributor_name', 'gross_box_o', 'admittance')
  
  df %>% mutate(
    film_rank = dplyr::row_number(),
    film_title = str_replace_all(.$film_title, '\\r|\\n', '') %>%
      str_replace_all('  ', ' '),
    gross_box_o = str_replace_all(.$gross_box_o, '\\.|,', '') %>%
      str_extract('[:digit:]*') %>% as.integer(),
    admittance = str_replace_all(.$admittance, '\\.|,', '') %>%
      str_extract('[:digit:]*') %>% as.integer()
  )
}
