vol_qry <- function(id, from, to) {
  query <- glue::glue('
    query {{
      trafficData(trafficRegistrationPointId: "{id}") {{
        volume {{
          byHour(from: "{from}", to: "{to}") {{
            edges {{
              node {{
                from
                to
                total {{
                  volumeNumbers {{
                    volume
                  }}
                }}
              }}
            }}
          }}
        }}
      }}
    }}
  ')
  
  return(query)
}

