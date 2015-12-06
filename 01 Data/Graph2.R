df1 <- COD %>% select(STATE,YEAR,AADR,CAUSE_NAME,DEATHS) %>% filter(YEAR == 2009 & CAUSE_NAME == "Suicide")

df2 <- NHCE %>% filter(CODE == 7,COUNTRY_GROUP == "State") %>% select(ITEM,STATE_NAME,Y2009) %>% rename(STATE = STATE_NAME, SPENDING = Y2009)

df <- dplyr::inner_join(df1,df2, by = "STATE")

ggplot() +
  coord_cartesian() +
  scale_x_continuous() + 
  scale_y_continuous() + 
  labs(title = "Prescription Drug Spending vs. Deaths by Suicide") +
  labs(x= "Spending (Millions of Dollars)",y = "Number of Deaths") +
  theme_gray() +
  theme(plot.title=element_text(size=20, face="bold", vjust=2)) +
  layer(data = df,
        mapping = aes(x = SPENDING, y = DEATHS),
        stat="identity", 
        stat_params=list(),
        geom="point",geom_params=list(),
        position=position_jitter(width=0.3, height=0))
