gather_all_data <- function(years) {
      x <- NULL
      for(i in years) {
            y <- gather_data(i)
            x <- rbind(x, y)

      }
      return(x)

}
