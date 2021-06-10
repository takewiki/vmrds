# 设置app标题-----
#1.2

app_title <-'域华电子数据中台V1.0';

# store data into rdbe in the rds database
app_id <- 'vmrds'

#设置数据库链接---

conn_be <- conn_rds('rdbe')



#设置链接---
conn <- conn_rds('nsic')

conn_erp = vmrdspkg::conn_vm_erp_test2()
conn_plm = vmrdspkg::conn_vm_plm_prd()



# 版本控制 --------
#V1.0--------
# 建议基本数据框架----

