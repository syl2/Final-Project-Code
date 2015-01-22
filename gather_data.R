gather_data <- function(whichyear) {
      #gathers data one year at a time using data from ws.data, yearly, and secref
      file.name <- paste("daily", whichyear, sep = ".")
      data(list = file.name)
      data(yearly)
      data(secref)

      x <- left_join(eval(parse(text = file.name)), secref)
      ##do not need volume for our analysis
      x <- select(x, -(volume.unadj:volume))
      ## view data by year
      y <- filter(yearly, year == whichyear)
      x <- left_join(x, y)
      x <- tbl_df(x)
      ##trim data to only include data for stocks in the top 1500 largest cap during a given year
      x <- filter(x, top.1500)
      ## remove companies with erroneous data
      x <- filter(x, ! symbol %in% c("CHTM", "3STTCE", "3MFNF", "KCI", "LDIG", "3CBHDE", "3AUFI", "PTIH", "BRCMB", "POFR", "3PUSH"))

      return(x)
}
