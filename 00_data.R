app_title <-'域华电子数据中台V4.0';
# store data into rdbe in the rds database
app_id <- 'vmrds'

#设置数据库链接---

conn_be <- conn_rds('rdbe')

#设置链接---
conn <- conn_rds('nsic')
# conn_erp <- vmrdspkg::conn_config_read("config/conn_erp.xlsx")
# conn_plm <- vmrdspkg::conn_config_read("config/conn_plm.xlsx")


# vm 测试环境
# conn_erp = vmrdspkg::conn_vm_erp_test2()
# conn_plm = vmrdspkg::conn_vm_plm_prd()

#RDS测试环境

#conn_erp = vmrdspkg::conn_vm_erp_test()
#conn_plm = vmrdspkg::conn_vm_plm_test()
conn_erp_config = tsda::conn_config("config/conn_erp.R")
conn_erp = tsda::conn_open(conn_config_info = conn_erp_config)
conn_plm_config = tsda::conn_config("config/conn_plm.R")
conn_plm = tsda::conn_open(conn_config_info = conn_plm_config)

# 正式环境
# conn_erp = vmrdspkg::conn_vm_erp_prd2()
# conn_plm = vmrdspkg::conn_vm_plm_prd2()

#测试环境

# cron_bom_file = '/home/hulilei/app/vmrds/cron/autoRun_bom.R'
# 
# cron_item_file ='/home/hulilei/app/vmrds/cron/autoRun_item.R'

#正式环境
cron_bom_file = '/srv/shiny-server/cron/autoRun_bom.R'

cron_item_file ='/srv/shiny-server/cron/autoRun_item.R'


