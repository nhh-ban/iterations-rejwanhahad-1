transform_metadata_to_df <- function(data){
  transformed_data <- data[[1]] |> 
                        map(as_tibble) |> 
                        list_rbind() |> 
                        mutate(latestData = map_chr(latestData, 1,
                                                    .default = NA_character_))|> 
                        mutate(latestData = as_datetime(latestData))|> 
                        unnest_wider(location) |>
                        unnest_wider(latLon)
  
  return(transformed_data)
}

#function 1

to_iso8601 <- function(date_time, offset) {
  # Add the offset to the date time
  adjusted_date_time <- date_time + offset * 86400  # 1 day = 86400 seconds
  
  # Format the adjusted date time in ISO8601 with "Z" to indicate UTC
  iso8601_string <- format(adjusted_date_time, format = "%Y-%m-%dT%H:%M:%SZ")
  
  return(iso8601_string)
}

#function 2
transform_volumes <- function(json_data) {
  # # Parse the JSON data
  # data_list <- fromJSON(json_data, flatten = TRUE)
  
  # Convert the list of data to a data frame
  df <- as.data.frame(json_data)
  
  return(df)
}
