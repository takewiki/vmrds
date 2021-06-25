menu_row <- tabItem(tabName = "row",
                    fluidRow(
                      column(width = 12,
                             tabBox(title ="物料管理工作台",width = 12,
                                    id='tabSet_row',height = '300px',
                                    tabPanel('ERP初始化物料导入PLM',tagList(
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
                                    # tabPanel('ERP初始化物料导入PLM(增量)',tagList(
                                    #   fluidRow(column(4,box(
                                    #     title = "操作区域", width = NULL, solidHeader = TRUE, status = "primary",
                                    #     actionButton(inputId = 'erp_item_intial2',label = '初始化物料导入')
                                    #   )),
                                    #   column(8, box(
                                    #     title = "报表区域", width = NULL, solidHeader = TRUE, status = "primary",
                                    #     
                                    #     tags$h4('限12346物料，对比中心表的ERP与PLM之间的物料代码数据')
                                    #   )
                                    #   ))
                                    #   
                                    # )),
                                    tabPanel('物料属性批量修改',tagList(
                                      fluidRow(column(4,box(
                                        title = "操作区域", width = NULL, solidHeader = TRUE, status = "primary",
                                        
                                        mdl_dateRange(id = 'mtrl_dates',startDate = Sys.Date()-7,endDate = Sys.Date()),
                                        actionButton('mtrl_getItem_fromPLM','获取PLM传入物料'),
                                        mdl_download_button('mtrl_downloadItem_fromPLM','下载PLM传入物料'),
                                        #actionButton('mtrl_downloadItem_fromPLM','下载PLM传入物料'),
                                        br(),
                                        hr(),
                                        tags$h4('确认后直接上传物料'),
                                        
                                        mdl_file('mtrl_fp_file','选择物料名称.xlsx'),
                                        textInput(inputId = 'mtrl_fp_sheetName',label = '选择页签',value = '物料'),
                                        actionButton('mtrl_fp_preview','预览物料属性'),
                                        actionButton('mtrl_fp_update','更新ERP物料'),
                                        actionButton('mtrl_fp_update_reset','更新激活更新')
                                        
                                      )),
                                      column(8, box(
                                        title = "报表区域", width = NULL, solidHeader = TRUE, status = "primary",
                                        div(style = 'overflow-x: scroll',mdl_dataTable('mtrl_fp_dataTable','预览物料名称数据'))
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