
# fyrst þarf að sækja upplýsingar um hvaða undirsíður eru til

source('./R_Sources/__init__.R')

raw.data <- fGet.info.from.kmi.site()
cleaned.list <- fClean.pre.rbind(raw.data)

top40 <- fExtract.table(cleaned.list, 1)
write.csv2(x = top40, 
           file = './_GognUt/top-40-movies-in-iceland-by-year.csv',
           row.names = FALSE)

icelandic.movies <- fExtract.table(cleaned.list, 2)
write.csv2(x = icelandic.movies, 
           file = './_GognUt/top-icelandic-movies-in-iceland-by-year.csv',
           row.names = FALSE)
