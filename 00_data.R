# 设置app标题-----

app_title <-'域华电子数据中台V1.0';

# store data into rdbe in the rds database
app_id <- 'vmrds'

#设置数据库链接---

conn_be <- conn_rds('rdbe')



#设置链接---
conn <- conn_rds('nsic')



# 版本控制 --------
#V1.0--------
# 建议基本数据框架----

