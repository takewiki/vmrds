menu_tutor <- tabItem(tabName = "tutor",
                      fluidRow(
                        column(width = 12,
                               tabBox(title ="日志管理工作台",width = 12,
                                      id='tabSet_tutor',height = '300px',
                                      tabPanel('日志管理',tagList(
                                        fluidRow(column(4,box(
                                          title = "操作区域", width = NULL, solidHeader = TRUE, status = "primary",
                                          'sheet1'
                                        )),
                                        column(8, box(
                                          title = "报表区域", width = NULL, solidHeader = TRUE, status = "primary",
                                          
                                          'rpt1'
                                        )
                                        ))
                                        
                                      )),
                                      tabPanel('ERP连接设置',tagList(
                                        fluidRow(column(6,offset = 2,box(
                                          title = "操作区域", width = NULL, solidHeader = TRUE, status = "primary",
                                          mdl_text(id = 'conn_erp_ip',label = 'ERP服务器地址',value = '123.207.201.140'),
                                          mdl_text(id = 'conn_erp_port',label = 'ERP服务器端口号',value = '1433'),
                                          mdl_text(id = 'conn_erp_user_name',label = 'ERP数据库用户名',value = 'sa'),
                                          mdl_password(id = 'conn_erp_password',label = 'ERP数据库密码',value='rds@2020'),
                                          mdl_text(id = 'conn_erp_db_name',label = '数据库名称',value ='AIS20140904110155' ),
                                          actionButton(inputId = 'conn_erp_test',label = '测试连接'),
                                          actionButton(inputId = 'conn_erp_setting',label = '设置连接')
                                          
                                        )))
                                        
                                      )),
                                      
                                      tabPanel('PLM连接设置',tagList(
                                        fluidRow(column(6,offset = 2,box(
                                          title = "操作区域", width = NULL, solidHeader = TRUE, status = "primary",
                                          mdl_text(id = 'conn_plm_ip',label = 'TC服务器地址',value = '123.207.201.140'),
                                          mdl_text(id = 'conn_plm_port',label = 'TC服务器端口号',value = '1433'),
                                          mdl_text(id = 'conn_plm_user_name',label = 'TC数据库用户名',value = 'sa'),
                                          mdl_password(id = 'conn_plm_password',label = 'TC数据库密码',value='rds@2020'),
                                          mdl_text(id = 'conn_plm_db_name',label = '数据库名称',value ='	TC4K3DB' ),
                                          actionButton(inputId = 'conn_plm_test',label = '测试连接'),
                                          actionButton(inputId = 'conn_plm_setting',label = '设置连接')
                                          
                                        )))
                                        
                                      )),
                                      tabPanel('sheet4',tagList(
                                        fluidRow(column(4,box(
                                          title = "操作区域", width = NULL, solidHeader = TRUE, status = "primary",
                                          'sheet4'
                                        )),
                                        column(8, box(
                                          title = "报表区域", width = NULL, solidHeader = TRUE, status = "primary",
                                          'rpt4'
                                        )
                                        ))
                                        
                                      ))
                                      
                                      
                                      
                               )
                        )
                      )
)