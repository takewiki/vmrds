menu_row <- tabItem(tabName = "row",
                    fluidRow(
                      column(width = 12,
                             tabBox(title ="物料管理工作台",width = 12,
                                    id='tabSet_row',height = '300px',
                                    tabPanel('ERP初始化物料导入PLM(全量)',tagList(
                                      fluidRow(column(4,box(
                                        title = "操作区域", width = NULL, solidHeader = TRUE, status = "primary",
                                        actionButton(inputId = 'erp_item_intial',label = '初始化物料导入')
                                      )),
                                      column(8, box(
                                        title = "报表区域", width = NULL, solidHeader = TRUE, status = "primary",
                                        
                                       'rpt1'
                                      )
                                      ))
                                      
                                    )),
                                    tabPanel('ERP初始化物料导入PLM(增量)',tagList(
                                      fluidRow(column(4,box(
                                        title = "操作区域", width = NULL, solidHeader = TRUE, status = "primary",
                                        actionButton(inputId = 'erp_item_intial2',label = '初始化物料导入')
                                      )),
                                      column(8, box(
                                        title = "报表区域", width = NULL, solidHeader = TRUE, status = "primary",
                                        
                                        tags$h4('限12346物料，对比中心表的ERP与PLM之间的物料代码数据')
                                      )
                                      ))
                                      
                                    )),
                                    tabPanel('物料属性批量修改',tagList(
                                      fluidRow(column(4,box(
                                        title = "操作区域", width = NULL, solidHeader = TRUE, status = "primary",
                                        tags$h4('物料属性批量修改-待更新，核心功能')
                                      )),
                                      column(8, box(
                                        title = "报表区域", width = NULL, solidHeader = TRUE, status = "primary",
                                       'rpt2'
                                      )
                                      ))
                                      
                                    )),
                                    
                                    tabPanel('初始化物料中间表对比',tagList(
                                      fluidRow(column(4,box(
                                        title = "操作区域", width = NULL, solidHeader = TRUE, status = "primary",
                                        'sheet3'
                                      )),
                                      column(8, box(
                                        title = "报表区域", width = NULL, solidHeader = TRUE, status = "primary",
                                        'rpt3'
                                      )
                                      ))
                                      
                                    ))
                                    
                                    
                                    
                             )
                      )
                    )
)