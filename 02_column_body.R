menu_column <- tabItem(tabName = "column",
                       fluidRow(
                         column(width = 12,
                                tabBox(title ="BOM管理工作台",width = 12,
                                       id='tabSet_column',height = '300px',
                                       tabPanel('ERP初始化BOM导入PLM-批量',tagList(
                                         fluidRow(column(4,box(
                                           title = "操作区域", width = NULL, solidHeader = TRUE, status = "primary",
                                           mdl_file(id = 'ERP_BOM_FILE',label = '请选择BOM导入物料，没有请下载模板'),
                                           tags$h4('第一次使用，请下载模板'),
                                           mdl_download_button(id = 'ERP_BOM_TPL_DL',label = '下载BOM模板'),
                                           actionButton(inputId = 'ERP_BOM_DONE',label = '导入BOM')
                                           
                                         )),
                                         column(8, box(
                                           title = "报表区域", width = NULL, solidHeader = TRUE, status = "primary",
                                           
                                           'rpt1'
                                         )
                                         ))
                                         
                                       )),
                                       tabPanel('ERP初始化BOM导入PLM-单个',tagList(
                                         fluidRow(column(4,box(
                                           title = "操作区域", width = NULL, solidHeader = TRUE, status = "primary",
                                           mdl_text('ERP_BOM_FNumber_one',label = '请录入BOM顶级物料代码:'),
                                           
                                           actionButton(inputId = 'ERP_BOM_DONE_one',label = '导入BOM'),
                                           actionButton(inputId = 'ERP_BOM_DONE_one_reset',label = '再次激活导入BOM')
                                         )),
                                         column(8, box(
                                           title = "报表区域", width = NULL, solidHeader = TRUE, status = "primary",
                                           '增加提示框，针对没有导入的BOM进行提醒'
                                         )
                                         ))
                                         
                                       ))
                                       #,
                                       
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