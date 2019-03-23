# collects the information from the kmi site
# returns a list containing the tables found on the sites (single scrape)
fGet.info.from.kmi.site <- function(
  url = paste0('http://www.kvikmyndamidstod.is/',
               'statistik/kvikmyndahus-og-dreifing/adsokn/')
  ){
  try(
    page <- read_html(url)
  )
  
  ts <- page %>% rvest::xml_nodes(css = 'table')
  t.names <- page %>% rvest::html_nodes(css = 'h2.collapse') %>% rvest::html_text()
  names(ts) <- t.names
  
  ts.table <- lapply(ts, html_table, fill=TRUE, header=TRUE)
  
  return(ts.table)
}