menu_book <- tabItem(tabName = "book",
                     fluidRow(
                       column(width = 12,
                              tabBox(title ="定时任务工作台",width = 12,
                                     id='tabSet_book',height = '300px',
                                     tabPanel('自动同步PLM物料至ERP',tagList(
                                       fluidRow(column(4,box(
                                         title = "操作区域", width = NULL, solidHeader = TRUE, status = "primary",
                                         mdl_integer(id = 'cron_time_item',label = '同步时间间隔0-60分钟',min = 1,max = 60,step = 1,value = 15),
                                         actionButton(inputId = 'cron_time_item_set',label = '物料同步间隔设置')
                                         
                                       )),
                                       column(8, box(
                                         title = "报表区域", width = NULL, solidHeader = TRUE, status = "primary",
                                         
                                         'rpt1'
                                       )
                                       ))
                                       
                                     )),
                                     tabPanel('自动同步PLMBOM至ERP',tagList(
                                       fluidRow(column(4,box(
                                         title = "操作区域", width = NULL, solidHeader = TRUE, status = "primary",
                                         mdl_integer(id = 'cron_time_bom',label = '同步时间间隔0-60分钟',min = 1,max = 60,step = 1,value = 15),
                                         actionButton(inputId = 'cron_time_bom_set',label = 'BOM同步间隔设置')
                                       )),
                                       column(8, box(
                                         title = "报表区域", width = NULL, solidHeader = TRUE, status = "primary",
                                         'rpt2'
                                       )
                                       ))
                                       
                                     ))
                                     # ,
                                     # 
                                     # tabPanel('sheet3',tagList(
                                     #   fluidRow(column(4,box(
                                     #     title = "操作区域", width = NULL, solidHeader = TRUE, status = "primary",
                                     #     'sheet3'
                                     #   )),
                                     #   column(8, box(
                                     #     title = "报表区域", width = NULL, solidHeader = TRUE, status = "primary",
                                     #     'rpt3'
                                     #   )
                                     #   ))
                                     #   
                                     # )),
                                     # tabPanel('sheet4',tagList(
                                     #   fluidRow(column(4,box(
                                     #     title = "操作区域", width = NULL, solidHeader = TRUE, status = "primary",
                                     #     'sheet4'
                                     #   )),
                                     #   column(8, box(
                                     #     title = "报表区域", width = NULL, solidHeader = TRUE, status = "primary",
                                     #     'rpt4'
                                     #   )
                                     #   ))
                                     #   
                                     # ))
                                     
                                     
                                     
                              )
                       )
                     )
)