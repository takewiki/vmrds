# 设置app标题-----
#1.5
# add the item batch modify.
#1.3
#1.2

app_title <-'域华电子数据中台V2.1';

# store data into rdbe in the rds database
app_id <- 'vmrds'

#设置数据库链接---

conn_be <- conn_rds('rdbe')



#设置链接---
conn <- conn_rds('nsic')


# vm 测试环境
# conn_erp = vmrdspkg::conn_vm_erp_test2()
# conn_plm = vmrdspkg::conn_vm_plm_prd()

#RDS测试环境

# conn_erp = vmrdspkg::conn_vm_erp_test()
# conn_plm = vmrdspkg::conn_vm_plm_test()

# 正式环境
conn_erp = vmrdspkg::conn_vm_erp_prd2()
conn_plm = vmrdspkg::conn_vm_plm_prd2()



# 版本控制 --------
#V1.0--------
# 建议基本数据框架----

