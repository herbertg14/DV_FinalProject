COD %>% select(CAUSE_NAME,STATE,DEATHS,AADR,YEAR) %>% filter(STATE == "Texas", (CAUSE_NAME == "Diabetes" | CAUSE_NAME == "Diseases of Heart"| CAUSE_NAME == "Alzheimers disease"| CAUSE_NAME == "Stroke"| CAUSE_NAME == "Chronic liver disease and cirrhosis"| CAUSE_NAME == "Cancer")) %>% ggplot(aes(x = YEAR, y = DEATHS, color = CAUSE_NAME)) + geom_point() + labs(title='Texas Leading COD 1999-2013') + labs(x="Year", y="Number of Deaths") +geom_line()




COD %>% select(CAUSE_NAME,STATE,AADR,YEAR) %>% filter(STATE == "Texas", (CAUSE_NAME == "Diabetes" | CAUSE_NAME == "Diseases of Heart"| CAUSE_NAME == "Alzheimers disease"| CAUSE_NAME == "Stroke"| CAUSE_NAME == "Chronic liver disease and cirrhosis"| CAUSE_NAME == "Cancer")) %>% ggplot(aes(x = YEAR, y = AADR, color = CAUSE_NAME)) + geom_point() + labs(title='Texas Leading COD 1999-2013') + labs(x="Year", y="Age-Adjusted Death Rate per 100,000 people") +geom_line()
