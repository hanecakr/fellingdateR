#'Detailed information on a sapwood data set
#'
#'@description This function returns more information on a sapwdood data set. It
#'lists the correct citation for the data set, the area the data set is supposed
#'to represent, the number of observations and summary stats of the raw data.
#'
#'@param x The name of a sapwood data set. you can use [sw_data_overview()] to
#'  get an overview of available data sets.
#'
#'@return A `list` with the following components:
#'
#'  * `data`: the name of the data set,
#'  * `citation`: the correct citation for the data set,
#'  * `area`: the area represented by the data set,
#'  * `n_observations`: the number of observations in the data set and,
#'  * `summary_raw_data`: summary stats of the raw data.
#'
#' @examples
#' # Get detailed information on a sapwood data set
#' sw_data_info("Hollstein_1980")
#'
#'# Retrieve the citation for a specific data set
#' sw_data_info("Sohar_2012_FWE_c")$citation
#'
#'@export

sw_data_info <- function (x = NULL) {
     sw_data <- as.character(x)

     if (length(sw_data) < 1) {
          stop(
               "No name of a sapwood dataset was provided.
See `sw_data_overview()` for an overview of available data sets."
          )
     }

     datasets <- sw_data_overview()
     if (!sw_data %in% datasets) {
          stop(
               paste0(
                    "--> '",
                    sw_data,
                    "' is not listed in package `fellingdater`\n
See `sw_data_overview()` for an overview of all available data sets."
               )
          )
     } else {
          sw_df <- get(sw_data)
          sw_df_long <- rep(sw_df$n_sapwood, sw_df$count)
          sw_df_attr <- attributes(sw_df)
          sw_summary <- summary(sw_df_long)


          output <- list(
               data = sw_data,
               citation = sw_df_attr$citation,
               area = sw_df_attr$area,
               n_observations = length(sw_df_long),
               summary_raw_data = sw_summary
          )
          return(output)
     }
}
