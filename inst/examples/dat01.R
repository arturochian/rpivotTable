library(jsonlite)
library(rpivotTable)

jsontxt <- '[ {"Province": "Quebec", "Party": "NDP", "Age": 22, "Name": "Liu, Laurin", "Gender": "Female"},
{"Province": "Quebec", "Party": "Bloc Quebecois", "Age": 43, "Name": "Mourani, Maria", "Gender": "Female"},
{"Province": "Quebec", "Party": "NDP", "Age": "", "Name": "Sellah, Djaouida", "Gender": "Female"},
{"Province": "Quebec", "Party": "NDP", "Age": 72, "Name": "St-Denis, Lise", "Gender": "Female"},
{"Province": "British Columbia", "Party": "Liberal", "Age": 71, "Name": "Fry, Hedy", "Gender": "Female"},
{"Province": "Quebec", "Party": "NDP", "Age": 70, "Name": "Turmel, Nycole", "Gender": "Female"},
{"Province": "Ontario", "Party": "Liberal", "Age": 68, "Name": "Sgro, Judy", "Gender": "Female"},
{"Province": "Quebec", "Party": "NDP", "Age": 67, "Name": "Raynault, Francine", "Gender": "Female"},
{"Province": "Ontario", "Party": "Conservative", "Age": 66, "Name": "Davidson, Patricia", "Gender": "Female"},
{"Province": "Manitoba", "Party": "Conservative", "Age": 65, "Name": "Smith, Joy", "Gender": "Female"}]'

# jsontxt <- '[ {"Province": "Quebec", "Party": "NDP", "Age": 22, "Name": "Liu, Laurin", "Gender": "Female"} ]'
rowcol <- '{ rows: ["Province"], cols: ["Party"] }'
validate(rowcol )
validate(jsontxt)
jsdf_ <- jsonlite::fromJSON(jsontxt)
jsdf_$Age <- as.numeric(jsdf_$Age)
# jsdl1_ <- RJSONIO::fromJSON(jsontxt)
# jsdl1_[[1]]
jsdata <- lapply(1:nrow(jsdf_), function(i) {
  l_ <- as.list(jsdf_[i, ])
  return(l_)})




rpivotTable(jsdata)
