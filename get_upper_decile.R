
get_upper_decile <- function(df){
      # Get stocks that are in bucket10 (the top extreme decile)
      #first runs split_buckets on dataframe
      x <- split_buckets(df)
      #returns unique symbols found in 10th bucket
      b10 <- unique(x$symbol[which(x$bucket=="bucket10")])
      return(b10)

}
