INFLATION <- data.frame(fromJSON(getURL(URLencode('skipper.cs.utexas.edu:5001/rest/native/?query="select * from INFLATION"'),httpheader=c(DB='jdbc:oracle:thin:@sayonara.microlab.cs.utexas.edu:1521:orcl', USER='C##cs329e_riw223', PASS='orcl_riw223', MODE='native_mode', MODEL='model', returnDimensions = 'False', returnFor = 'JSON'), verbose = TRUE), ))

POPULATION = data.frame(fromJSON(getURL(URLencode('skipper.cs.utexas.edu:5001/rest/native/?query="select * from CENSUS_ESTIMATES"'),httpheader=c(DB='jdbc:oracle:thin:@sayonara.microlab.cs.utexas.edu:1521:orcl', USER='C##cs329e_riw223', PASS='orcl_riw223', MODE='native_mode', MODEL='model', returnDimensions = 'False', returnFor = 'JSON'), verbose = TRUE), ))

NHCE <- melt(data.frame(fromJSON(getURL(URLencode('skipper.cs.utexas.edu:5001/rest/native/?query="""
                                             select ITEM,(1000*Y1980/14229191) AS Y1980,(1000*Y1980/14229191) as Y1980IN,
(1000 * Y1981/14746318) AS Y1981,((1000 * Y1980/14746318)*POWER(1.06,1)) AS Y1981IN,
(1000 * Y1982/15331415) AS Y1982,((1000 * Y1980/15331415)*POWER(1.06,2)) AS Y1982IN,
(1000 * Y1983/15751676) AS Y1983,((1000 * Y1980/15751676)*POWER(1.06,3)) AS Y1983IN,
(1000 * Y1984/16007086) AS Y1984,((1000 * Y1980/16007086)*POWER(1.06,4)) AS Y1984IN,
(1000 * Y1985/16272734) AS Y1985,((1000 * Y1980/16272734)*POWER(1.06,5)) AS Y1985IN,
(1000 * Y1986/16561113) AS Y1986,((1000 * Y1980/16561113)*POWER(1.06,6)) AS Y1986IN,
(1000 * Y1987/16621791) AS Y1987,((1000 * Y1980/16621791)*POWER(1.06,7)) AS Y1987IN,
(1000 * Y1988/16667022) AS Y1988,((1000 * Y1980/16667022)*POWER(1.06,8)) AS Y1988IN,
(1000 * Y1989/16806735) AS Y1989,((1000 * Y1980/16806735)*POWER(1.06,9)) AS Y1989IN,
(1000 * Y1990/17044714) AS Y1990,((1000 * Y1980/17044714)*POWER(1.06,10)) AS Y1990IN,
(1000 * Y1991/17339904) AS Y1991,((1000 * Y1980/17339904)*POWER(1.06,11)) AS Y1991IN,
(1000 * Y1992/17650479) AS Y1992,((1000 * Y1980/17650479)*POWER(1.06,12)) AS Y1992IN,
(1000 * Y1993/17996764) AS Y1993,((1000 * Y1980/17996764)*POWER(1.06,13)) AS Y1993IN,
(1000 * Y1994/18338319) AS Y1994,((1000 * Y1980/18338319)*POWER(1.06,14)) AS Y1994IN,
(1000 * Y1995/18679706) AS Y1995,((1000 * Y1980/18679706)*POWER(1.06,15)) AS Y1995IN,
(1000 * Y1996/19006240) AS Y1996,((1000 * Y1980/19006240)*POWER(1.06,16)) AS Y1996IN,
(1000 * Y1997/19355427) AS Y1997,((1000 * Y1980/19355427)*POWER(1.06,17)) AS Y1997IN,
(1000 * Y1998/19712389) AS Y1998,((1000 * Y1980/19712389)*POWER(1.06,18)) AS Y1998IN,
(1000 * Y1999/20044141) AS Y1999,((1000 * Y1980/20044141)*POWER(1.06,19)) AS Y1999IN,
(1000 * Y2000/20949316) AS Y2000,((1000 * Y1980/20949316)*POWER(1.06,20)) AS Y2000IN,
(1000 * Y2001/21334855) AS Y2001,((1000 * Y1980/21334855)*POWER(1.06,21)) AS Y2001IN,
(1000 * Y2002/21723220) AS Y2002,((1000 * Y1980/21723220)*POWER(1.06,22)) AS Y2002IN,
(1000 * Y2003/22103374) AS Y2003,((1000 * Y1980/22103374)*POWER(1.06,23)) AS Y2003IN,
(1000 * Y2004/22490022) AS Y2004,((1000 * Y1980/22490022)*POWER(1.06,24)) AS Y2004IN,
(1000 * Y2005/22928508) AS Y2005,((1000 * Y1980/22928508)*POWER(1.06,25)) AS Y2005IN,
(1000 * Y2006/23507783) AS Y2006,((1000 * Y1980/23507783)*POWER(1.06,26)) AS Y2006IN,
(1000 * Y2007/23904380) AS Y2007,((1000 * Y1980/23904380)*POWER(1.06,27)) AS Y2007IN,
(1000 * Y2008/24326974) AS Y2008,((1000 * Y1980/24326974)*POWER(1.06,28)) AS Y2008IN,
(1000 * Y2009/24782302) AS Y2009,((1000 * Y1980/24782302)*POWER(1.06,29)) AS Y2009IN
FROM (select * from NHCE where STATE_NAME = \\\'Texas\\\')
                                             """'),httpheader=c(DB='jdbc:oracle:thin:@sayonara.microlab.cs.utexas.edu:1521:orcl', USER='C##cs329e_riw223', PASS='orcl_riw223', MODE='native_mode', MODEL='model', returnDimensions = 'False', returnFor = 'JSON'), verbose = TRUE), )),id.var="ITEM")




ggplot () + 
  coord_cartesian() +
  scale_x_discrete() +
  scale_y_continuous() +
  labs(title = 'Annual Per Capita Healthcare Expenditure in Texas by Service Type',x='Year',y="Average Annual Spending in 1000's of Dollars") +
  layer(data = NHCE, 
        mapping = aes(x = variable, y =value, fill = ITEM), 
        stat = 'identity',
        geom = 'bar') + 
  theme(axis.text.x = element_text(angle = 45,size = 12))



