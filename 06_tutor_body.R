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
                                        fluidRow(column(4,box(
                                          title = "操作区域", width = NULL, solidHeader = TRUE, status = "primary",
                                          tsui::mdl_sql_conn(id = 'conn_erp',label = 'ERP连接信息')
                                        )),
                                        column(8, box(
                                          title = "报表区域", width = NULL, solidHeader = TRUE, status = "primary",
                                          'rpt2'
                                        )
                                        ))
                                        
                                      )),
                                      
                                      tabPanel('PLM连接设置',tagList(
                                        fluidRow(column(4,box(
                                          title = "操作区域", width = NULL, solidHeader = TRUE, status = "primary",
                                          tsui::mdl_sql_conn(id = 'conn_plm',label = 'PLM连接信息')
                                        )),
                                        column(8, box(
                                          title = "报表区域", width = NULL, solidHeader = TRUE, status = "primary",
                                          'rpt3'
                                        )
                                        ))
                                        
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