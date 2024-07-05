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
                                       ,

                                        tabPanel('BOM删除',tagList(
                                          fluidRow(column(4,box(
                                            title = "操作区域", width = NULL, solidHeader = TRUE, status = "primary",
                                            mdl_text('ERP_BOM_del_FNumber',label = '请录入物料编码:'),
                                            mdl_text('ERP_BOM_del_FVersion',label = '请录入物料版本:',value = 'A'),
                                            tags$h4('BOM查询用于显示ERP物料最新版本'),
                                            actionButton(inputId = 'ERP_BOM_query_action',label = 'BOM查询'),
                                            tags$h4('BOM删除用于删除指定的版本'),
                                            shiny::checkboxInput(inputId = 'erp_bom_check',label = '是否检查BOM在生产任务单中已引用',value = TRUE),
                                            actionButton(inputId = 'ERP_BOM_del_action',label = 'BOM删除'),
                                            tags$h4('BOM恢复用于恢复最近一次误删记录。'),
                                            actionButton(inputId = 'ERP_BOM_recover_action',label = 'BOM恢复')
                                          )),
                                          column(8, box(
                                            title = "报表区域", width = NULL, solidHeader = TRUE, status = "primary",
                                            tsui::mdl_dataTable(id = 'ERP_BOM_VERSION_DT')
                                          )
                                          ))
                                       
                                        )),
                                       tabPanel('BOM降版',tagList(
                                         fluidRow(column(4,box(
                                           title = "操作区域", width = NULL, solidHeader = TRUE, status = "primary",
                                           mdl_text('ERP_BOM_degrade_FNumber',label = '请录入产品编码:'),
                                           mdl_text('ERP_BOM_degrade_FBomNumber',label = '请录入BOM编号:'),
                                           mdl_text('ERP_BOM_degrade_FVersion_from',label = '高版本从:',value = 'B'),
                                           mdl_text('ERP_BOM_degrade_FVersion_to',label = '低版本到:',value = 'A'),
                                           mdl_text('ERP_BOM_degrade_days',label = '查询最近N天的中间表记录',value = '7'),
                                           
                                           actionButton(inputId = 'ERP_BOM_degrade_action',label = 'BOM降版')
                                         )),
                                         column(8, box(
                                           title = "报表区域", width = NULL, solidHeader = TRUE, status = "primary",
                                           ''
                                         )
                                         ))
                                         
                                       )),
                                       tabPanel('BOM子版本查询',tagList(
                                         fluidRow(column(4,box(
                                           title = "操作区域", width = NULL, solidHeader = TRUE, status = "primary",
                                           mdl_text('ERP_BOM_subVer_FNumber',label = '请录入物料编码:'),
                                           mdl_text('ERP_BOM_subVer_FVersion_from',label = '主版本:',value = 'A'),
                                           mdl_text('ERP_BOM_subVer_FVersion_to',label = '子版本:',value = '01'),
                                           actionButton(inputId = 'ERP_BOM_subVer_action',label = 'BOM子版本查询')
                                         )),
                                         column(8, box(
                                           title = "报表区域", width = NULL, solidHeader = TRUE, status = "primary",
                                           ''
                                         )
                                         ))
                                         
                                       ))
                                       #,
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
