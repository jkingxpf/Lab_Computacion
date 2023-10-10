#Joaquín Fernández Suárez
extraer_codigo_empresa <- function(c){
  subcadena <- strsplit(c,':')
  return(subcadena)
}

ca <- "28 : 291875 :	INDRA FACTORÍA TECNOLÓGICA, S.L.U. :	2"
