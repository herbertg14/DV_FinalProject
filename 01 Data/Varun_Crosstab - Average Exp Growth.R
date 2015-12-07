NHCE <- data.frame(fromJSON(getURL(URLencode('skipper.cs.utexas.edu:5001/rest/native/?query="select * from NHCE"'),httpheader=c(DB='jdbc:oracle:thin:@sayonara.microlab.cs.utexas.edu:1521:orcl', USER='C##cs329e_hog74', PASS='orcl_hog74', MODE='native_mode', MODEL='model', returnDimensions = 'False', returnFor = 'JSON'), verbose = TRUE), ))

df1 <- NHCE %>% select(ITEM,STATE_NAME,AVERAGE_ANNUAL_PERCENT_GROWTH) %>% filter(ITEM != 'Total State Spending',STATE_NAME != 'null') %>% mutate(LOW = (AVERAGE_ANNUAL_PERCENT_GROWTH) %/% 7.01) %>% mutate(MED = (AVERAGE_ANNUAL_PERCENT_GROWTH) %/% 10) %>% mutate(HIGH = LOW + MED)  

df1 %>% ggplot(aes(x=STATE_NAME,y=ITEM,label=round(AVERAGE_ANNUAL_PERCENT_GROWTH,digits = 2),color = factor(HIGH))) + geom_text() + labs(title = "Average Healthcare Expenditure Growth", x = "Item", y = "State") + scale_colour_manual(values = c("green", "blue", "red", "red"), labels = c("low", "medium", "high", "high")) + coord_flip()

