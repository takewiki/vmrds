menu_row <- tabItem(tabName = "row",
                    fluidRow(
                      column(width = 12,
                             tabBox(title ="物料管理工作台",width = 12,
                                    id='tabSet_row',height = '300px',
                                
                                    tabPanel('ERP2PLM同步物料(日常)',tagList(
                                      fluidRow(column(8,box(
                                        title = "操作区域", width = NULL, solidHeader = TRUE, status = "primary",
                                        tags$h4('请填写多个物料编码,使用逗号,间隔,物料编码之间不保留多余的空格'),
                                        mdl_text(id = 'erp_item_options_show',label = '选择多个待导入的物料编码',value = '1.100.01.001,120.01.002'),
                                        actionButton(inputId = 'erp_item_intial2',label = '同步物料至PLM'),
                                        br(),
                                        hr(),
                                        tags$h4('限12346物料，对比中心表的ERP与PLM之间的物料代码数据'),
                                        actionButton(inputId = 'erp_item_intial_newRead',label = '查看所有新增物料'),
                                        actionButton(inputId = 'erp_item_intial_newWrite',label = '同步所有新增物料')
                                        
                                      )),
                                      column(4, box(
                                        title = "报表区域", width = NULL, solidHeader = TRUE, status = "primary",
                                        div(style = 'overflow-x: scroll',mdl_dataTable('erp_item_intial_newWrite_dataView','预览物料名称数据'))

                                        
                                      )
                                      ))

                                    )),
                                    tabPanel('PLM2ERP物料属性批量修改',tagList(
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
                                      
                                    ))
                                    #后续增加相应的功能,暂时没有放出来
                                    # ,
                                    # 
                                    # tabPanel('初始化物料中间表对比',tagList(
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
                                    # ))
                                    
                                    
                                    
                             )
                      )
                    )
)