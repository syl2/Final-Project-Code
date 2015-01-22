
get_lower_decile <- function(df){

      # Get stocks that are in bucket1 (the bottom extreme decile)

      #first runs split_buckets on dataframe
      x <- split_buckets(df)

      #returns unique symbols found in 1st bucket

      b1 <- unique(x$symbol[which(x$bucket=="bucket1")])
      return (b1)

}
