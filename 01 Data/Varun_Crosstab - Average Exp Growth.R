df1 <- NHCE %>% select(CODE, ITEM,STATE_NAME,AVERAGE_ANNUAL_PERCENT_GROWTH) %>% filter(ITEM != 'Total State Spending',STATE_NAME != 'null') %>% mutate(LOW = (AVERAGE_ANNUAL_PERCENT_GROWTH) %/% 7.01) %>% mutate(MED = (AVERAGE_ANNUAL_PERCENT_GROWTH) %/% 10) %>% mutate(HIGH = LOW + MED)  


df1 %>% ggplot(aes(x=STATE_NAME,y=ITEM,label=round(AVERAGE_ANNUAL_PERCENT_GROWTH,digits = 2),color = factor(HIGH))) + geom_text() + labs(title = "Average Healthcare Expenditure Growth", x = "Item", y = "State") + scale_colour_manual(values = c("green", "blue", "red", "red"), labels = c("low", "medium", "high", "high")) + coord_flip()

