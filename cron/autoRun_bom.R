library(vmrdspkg)
library(cronR)
# conn_erp = vmrdspkg::conn_vm_erp_test()
# conn_plm = vmrdspkg::conn_vm_plm_test()


# conn_erp = conn_vm_erp_test2()
# conn_plm = conn_vm_plm_prd()

# conn_erp = conn_vm_erp_prd2()
# conn_plm = conn_vm_plm_prd2()

# conn_erp <- vmrdspkg::conn_config_read("/srv/shiny-server/config/conn_erp.xlsx")
# conn_plm <- vmrdspkg::conn_config_read("/srv/shiny-server/config/conn_plm.xlsx")

conn_erp <- vmrdspkg::conn_config_read("/srv/shiny-server/config/conn_erp_rds.xlsx")
conn_plm <- vmrdspkg::conn_config_read("/srv/shiny-server/config/conn_plm_rds.xlsx")
print('rds-hello-bom!')
sync_PLMtoERP_BOM_periodly(conn_plm = conn_plm,conn_erp = conn_erp )


bom_readIntoERP_ALL(conn = conn_erp)
