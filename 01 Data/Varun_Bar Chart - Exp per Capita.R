NHCE <- data.frame(fromJSON(getURL(URLencode('skipper.cs.utexas.edu:5001/rest/native/?query="select * from NHCE"'),httpheader=c(DB='jdbc:oracle:thin:@sayonara.microlab.cs.utexas.edu:1521:orcl', USER='C##cs329e_hog74', PASS='orcl_hog74', MODE='native_mode', MODEL='model', returnDimensions = 'False', returnFor = 'JSON'), verbose = TRUE), ))

state_pop <- data.frame(fromJSON(getURL(URLencode('skipper.cs.utexas.edu:5001/rest/native/?query="select * from state_pop"'),httpheader=c(DB='jdbc:oracle:thin:@sayonara.microlab.cs.utexas.edu:1521:orcl', USER='C##cs329e_vp5467', PASS='orcl_vp5467', MODE='native_mode', MODEL='model', returnDimensions = 'False', returnFor = 'JSON'), verbose = TRUE), ))

df1 <- NHCE %>% select(STATE_NAME, Y2009, REGION_NAME, CODE) %>% filter(STATE_NAME != 'null', CODE != '12') %>% group_by(STATE_NAME, REGION_NAME) %>% summarize(Y2009 = sum(Y2009)) %>% rename(STATE = STATE_NAME)

df2 <- state_pop %>% select(STATE, NINE) %>% filter(STATE %in% c('Source: ', 'Puerto Rico') == FALSE, NINE != 'null')

df <- dplyr::inner_join(df1,df2,by = "STATE")

df <- df %>% select(STATE, REGION_NAME, Y2009, NINE) %>% mutate(HC_exp_capita = as.numeric(as.character(1000000*as.numeric(as.character(Y2009))/as.numeric(as.character(NINE)))))

ggplot(df, aes(x = reorder(STATE, HC_exp_capita), y = HC_exp_capita, fill = REGION_NAME)) + labs(title = "Healthcare Expenditures per Capita by State", x = "State", y = "Healthcare Expenditures per Capita") + geom_bar(stat = 'identity') + coord_flip()
