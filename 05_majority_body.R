menu_majority <- tabItem(tabName = "majority",
                         fluidRow(
                           column(width = 12,
                                  tabBox(title ="报表分析工作台",width = 12,
                                         id='tabSet_majority',height = '300px',
                                         tabPanel('物料分析',tagList(
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
                                         tabPanel('BOM分析',tagList(
                                           fluidRow(column(4,box(
                                             title = "操作区域", width = NULL, solidHeader = TRUE, status = "primary",
                                             'sheet2'
                                           )),
                                           column(8, box(
                                             title = "报表区域", width = NULL, solidHeader = TRUE, status = "primary",
                                             'rpt2'
                                           )
                                           ))
                                           
                                         ))
                                         
                                         
                                         
                                  )
                           )
                         )
)