menu_majority <- tabItem(tabName = "majority",
                         fluidRow(
                           column(width = 12,
                                  tabBox(title ="报表分析工作台",width = 12,
                                         id='tabSet_majority',height = '300px',
                                         tabPanel('ERPtoPLM物料日志分析',tagList(
                                           fluidRow(column(4,box(
                                             title = "操作区域", width = NULL, solidHeader = TRUE, status = "primary",
                                             mdl_dateRange(id = 'log_dates_1',label = '请选择日期范围',startDate = Sys.Date()-31,
                                                           endDate = Sys.Date()
                                                           ),
                                             actionButton(inputId ='log_query1',label = '查询日志' 
                                                            )
                                           )),
                                           column(8, box(
                                             title = "报表区域", width = NULL, solidHeader = TRUE, status = "primary",
                                             
                                             echarts4rOutput('chart1')
                                           )
                                           )) ,
                                           fluidRow(column(12,box(
                                                           title = "详细区域", width = NULL, solidHeader = TRUE, status = "primary",
                                                           tags$p('在上图中选择一个日期节点'),
                                                           
                                                           DTOutput('dt1')
                                                           ))
                                           
                                         ))),
                                         tabPanel('ERPtoPLMBOM日志分析',tagList(
                                           fluidRow(column(4,box(
                                             title = "操作区域", width = NULL, solidHeader = TRUE, status = "primary",
                                             mdl_dateRange(id = 'log_dates_2',label = '请选择日期范围',startDate = Sys.Date()-31,
                                                           endDate = Sys.Date()
                                             ),
                                             actionButton(inputId ='log_query2',label = '查询日志' 
                                             )
                                           )),
                                           column(8, box(
                                             title = "报表区域", width = NULL, solidHeader = TRUE, status = "primary",
                                             
                                             echarts4rOutput('chart2')
                                           )
                                           )) ,
                                           fluidRow(column(12,box(
                                             title = "详细区域", width = NULL, solidHeader = TRUE, status = "primary",
                                             tags$p('在上图中选择一个日期节点'),
                                             
                                             DTOutput('dt2')
                                           ))
                                           
                                           ))),
                                         tabPanel('PLMtoERP物料日志分析',tagList(
                                           fluidRow(column(4,box(
                                             title = "操作区域", width = NULL, solidHeader = TRUE, status = "primary",
                                             mdl_dateRange(id = 'log_dates_3',label = '请选择日期范围',startDate = Sys.Date()-31,
                                                           endDate = Sys.Date()
                                             ),
                                             actionButton(inputId ='log_query3',label = '查询日志' 
                                             )
                                           )),
                                           column(8, box(
                                             title = "报表区域", width = NULL, solidHeader = TRUE, status = "primary",
                                             
                                             echarts4rOutput('chart3')
                                           )
                                           )) ,
                                           fluidRow(column(12,box(
                                             title = "详细区域", width = NULL, solidHeader = TRUE, status = "primary",
                                             tags$p('在上图中选择一个日期节点'),
                                             
                                             DTOutput('dt3')
                                           ))
                                           
                                           ))),
                                         tabPanel('PLMtoERPBOM日志分析',tagList(
                                           fluidRow(column(4,box(
                                             title = "操作区域", width = NULL, solidHeader = TRUE, status = "primary",
                                             mdl_dateRange(id = 'log_dates_4',label = '请选择日期范围',startDate = Sys.Date()-31,
                                                           endDate = Sys.Date()
                                             ),
                                             actionButton(inputId ='log_query4',label = '查询日志' 
                                             )
                                           )),
                                           column(8, box(
                                             title = "报表区域", width = NULL, solidHeader = TRUE, status = "primary",
                                             
                                             echarts4rOutput('chart4')
                                           )
                                           )) ,
                                           fluidRow(column(12,box(
                                             title = "详细区域", width = NULL, solidHeader = TRUE, status = "primary",
                                             tags$p('在上图中选择一个日期节点'),
                                             
                                             DTOutput('dt4')
                                           ))
                                           
                                           ))),
                                         tabPanel('下达状态的生产任务投料单及BOM差异分析(按任务单号)',tagList(
                                           fluidRow(column(4,box(
                                             title = "操作区域", width = NULL, solidHeader = TRUE, status = "primary",
                                             mdl_text(id = 'icmo_bom_ppbom_number',label = '请输入下达状态的任务单号:',value = 'WORK017602'),
                                             actionButton(inputId ='icmo_bom_ppbom_number_btn',label = '查询差异分析'),
                                             mdl_download_button(id = 'icmo_bom_ppbom_number_dl',label = '下载差异分析')
                                           )),
                                           column(8, box(
                                             title = "报表区域", width = NULL, solidHeader = TRUE, status = "primary",
                                             
                                             div(style = 'overflow-x: scroll',mdl_dataTable('icmo_bom_ppbom_number_btn_dataTable','预览差异'))
                                           )
                                           ))
                                           
                                         )),
                                         tabPanel('下达状态的生产任务投料单及BOM差异分析(按物料号)',tagList(
                                           fluidRow(column(4,box(
                                             title = "操作区域", width = NULL, solidHeader = TRUE, status = "primary",
                                             mdl_text(id = 'icmo_bom_ppbom_item',label = '请输入物料号:',value = '1.207.01.00002'),
                                             actionButton(inputId ='icmo_bom_ppbom_item_btn',label = '查询差异分析'),
                                             mdl_download_button(id = 'icmo_bom_ppbom_item_dl',label = '下载差异分析')
                                           )),
                                           column(8, box(
                                             title = "报表区域", width = NULL, solidHeader = TRUE, status = "primary",
                                             div(style = 'overflow-x: scroll',mdl_dataTable('icmo_bom_ppbom_item_btn_dataTable','预览差异'))
                                           )
                                           ))
                                           
                                         ))
                                         
                                         
                                         
                                  )
                           )
                         )
)