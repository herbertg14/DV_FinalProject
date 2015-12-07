require("ggplot2")
require("gplots")
require("grid")
require("RCurl")
require("reshape2")
require("tableplot")
require("tidyr")
require("dplyr")
require("jsonlite")
require("lubridate")


state_pop <- data.frame(fromJSON(getURL(URLencode('skipper.cs.utexas.edu:5001/rest/native/?query="select * from state_pop"'),httpheader=c(DB='jdbc:oracle:thin:@sayonara.microlab.cs.utexas.edu:1521:orcl', USER='C##cs329e_vp5467', PASS='orcl_vp5467', MODE='native_mode', MODEL='model', returnDimensions = 'False', returnFor = 'JSON'), verbose = TRUE), ))

summary(state_pop)
head(state_pop)

