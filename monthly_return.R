monthly_return <- function(df){
      # Returns a single row per symbol per month
      # cum_ret is the cumulative return as of the last month

      df %>%
            mutate(month = month(v.date, label = TRUE)) %>%
            group_by(month) %>%
            #orders dates of each month group in descending order
            mutate(day_rank = row_number(desc(v.date))) %>%

            #finds the last day of each month into a dates data frame
            filter(day_rank == 1) %>%
            ungroup() %>%
            select(v.date) -> dates

      df  %>%
            select(-top.1500, -name, -id) %>%
            mutate(month = month(v.date, label = TRUE)) %>%
            #arranges data frame by symbol and by month
            group_by(symbol, month) %>%
            arrange(symbol, v.date)  %>%
            #creates new column that calculates cumulative monthly return
            mutate(cum_ret = cumprod(1+tret) - 1) %>%
            #only displays dates in dates dataframe (last date of each month)
            filter(v.date %in% dates$v.date)

}
