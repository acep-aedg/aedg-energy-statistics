read_clean_write <- function(url, sheet, output) {

  temp <- tempfile(fileext = ".xlsx") 

  download.file(url, destfile = temp, mode = "wb") 

  df = read_excel(path = temp, sheet = sheet) %>% 
    clean_names()

    dir.create(dirname(output), recursive = TRUE, showWarnings = FALSE)
  
    write_csv(df, output) 
} 
