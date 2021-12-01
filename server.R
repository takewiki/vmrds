
library(readxl)
bom_tpl <- read_excel("www/bom_tpl.xlsx", 
                      sheet = "BOM")
bom_data <- list(bom_tpl)
names(bom_data) <- "BOM"


#shinyserver start point----
 shinyServer(function(input, output,session) {
    #00-基础框设置-------------
    #读取用户列表
    user_base <- getUsers(conn_be,app_id)
    
    
    
    credentials <- callModule(shinyauthr::login, "login", 
                              data = user_base,
                              user_col = Fuser,
                              pwd_col = Fpassword,
                              hashed = TRUE,
                              algo = "md5",
                              log_out = reactive(logout_init()))
    
    
    
    logout_init <- callModule(shinyauthr::logout, "logout", reactive(credentials()$user_auth))
    
    observe({
       if(credentials()$user_auth) {
          shinyjs::removeClass(selector = "body", class = "sidebar-collapse")
       } else {
          shinyjs::addClass(selector = "body", class = "sidebar-collapse")
       }
    })
    
    user_info <- reactive({credentials()$info})
    
    #显示用户信息
    output$show_user <- renderUI({
       req(credentials()$user_auth)
       
       dropdownButton(
          fluidRow(  box(
             title = NULL, status = "primary", width = 12,solidHeader = FALSE,
             collapsible = FALSE,collapsed = FALSE,background = 'black',
             #2.01.01工具栏选项--------
             
             
             actionLink('cu_updatePwd',label ='修改密码',icon = icon('gear') ),
             br(),
             br(),
             actionLink('cu_UserInfo',label = '用户信息',icon = icon('address-card')),
             br(),
             br(),
             actionLink(inputId = "closeCuMenu",
                        label = "关闭菜单",icon =icon('window-close' ))
             
             
          )) 
          ,
          circle = FALSE, status = "primary", icon = icon("user"), width = "100px",
          tooltip = FALSE,label = user_info()$Fuser,right = TRUE,inputId = 'UserDropDownMenu'
       )
       #
       
       
    })
    
    observeEvent(input$closeCuMenu,{
       toggleDropdownButton(inputId = "UserDropDownMenu")
    }
    )
    
    #修改密码
    observeEvent(input$cu_updatePwd,{
       req(credentials()$user_auth)
       
       showModal(modalDialog(title = paste0("修改",user_info()$Fuser,"登录密码"),
                             
                             mdl_password('cu_originalPwd',label = '输入原密码'),
                             mdl_password('cu_setNewPwd',label = '输入新密码'),
                             mdl_password('cu_RepNewPwd',label = '重复新密码'),
                             
                             footer = column(shiny::modalButton('取消'),
                                             shiny::actionButton('cu_savePassword', '保存'),
                                             width=12),
                             size = 'm'
       ))
    })
    
    #处理密码修改
    
    var_originalPwd <-var_password('cu_originalPwd')
    var_setNewPwd <- var_password('cu_setNewPwd')
    var_RepNewPwd <- var_password('cu_RepNewPwd')
    
    observeEvent(input$cu_savePassword,{
       req(credentials()$user_auth)
       #获取用户参数并进行加密处理
       var_originalPwd <- password_md5(var_originalPwd())
       var_setNewPwd <-password_md5(var_setNewPwd())
       var_RepNewPwd <- password_md5(var_RepNewPwd())
       check_originalPwd <- password_checkOriginal(fappId = app_id,fuser =user_info()$Fuser,fpassword = var_originalPwd,conn = conn_be)
       check_newPwd <- password_equal(var_setNewPwd,var_RepNewPwd)
       if(check_originalPwd){
          #原始密码正确
          #进一步处理
          if(check_newPwd){
             password_setNew(fappId = app_id,fuser =user_info()$Fuser,fpassword = var_setNewPwd,conn = conn_be)
             pop_notice('新密码设置成功:)') 
             shiny::removeModal()
             
          }else{
             pop_notice('两次输入的密码不一致，请重试:(') 
          }
          
          
       }else{
          pop_notice('原始密码不对，请重试:(')
       }
       
       
       
       
       
    }
    )
    
    
    
    #查看用户信息
    
    #修改密码
    observeEvent(input$cu_UserInfo,{
       req(credentials()$user_auth)
       
       user_detail <-function(fkey){
          res <-tsui::userQueryField(conn = conn_be,app_id = app_id,user =user_info()$Fuser,key = fkey)
          return(res)
       } 
       
       
       showModal(modalDialog(title = paste0("查看",user_info()$Fuser,"用户信息"),
                             
                             textInput('cu_info_name',label = '姓名:',value =user_info()$Fname ),
                             textInput('cu_info_role',label = '角色:',value =user_info()$Fpermissions ),
                             textInput('cu_info_email',label = '邮箱:',value =user_detail('Femail') ),
                             textInput('cu_info_phone',label = '手机:',value =user_detail('Fphone') ),
                             textInput('cu_info_rpa',label = 'RPA账号:',value =user_detail('Frpa') ),
                             textInput('cu_info_dept',label = '部门:',value =user_detail('Fdepartment') ),
                             textInput('cu_info_company',label = '公司:',value =user_detail('Fcompany') ),
                             
                             
                             footer = column(shiny::modalButton('确认(不保存修改)'),
                                             
                                             width=12),
                             size = 'm'
       ))
    })
    
    
    
    #针对用户信息进行处理
    
    sidebarMenu <- reactive({
       
       res <- setSideBarMenu(conn_rds('rdbe'),app_id,user_info()$Fpermissions)
       return(res)
    })
    
    
    #针对侧边栏进行控制
    output$show_sidebarMenu <- renderUI({
       if(credentials()$user_auth){
          return(sidebarMenu())
       } else{
          return(NULL) 
       }
       
       
    })
    
    #针对工作区进行控制
    output$show_workAreaSetting <- renderUI({
       if(credentials()$user_auth){
          return(workAreaSetting)
       } else{
          return(NULL) 
       }
       
       
    })
    
    # 1 ITEM -------
    
    observeEvent(input$erp_item_intial,{
      
         try(vmrdspkg::ERPtoPLM_Item_ALL(conn_erp = conn_erp,conn_plm = conn_plm))
         pop_notice('初始化物料成功写入PLM！')
         
      
      
    })
    
    # 相应的处理数据
    var_erp_item_options_show <- var_text('erp_item_options_show')
    observeEvent(input$erp_item_intial2,{
      FNumbers = var_erp_item_options_show() 
      
      res <-try(vmrdspkg::item_selectValue_ERP2PLM_multi(conn_erp = conn_erp,conn_plm = conn_plm,FNumbers = FNumbers))
      if (res){
        pop_notice('物料成功写入PLM！')
      }else{
        pop_notice('物料成功写入PLM失败，请检验物料编码是否确认！')
      }

      
      
      
    })
    
    #物料导入事项-------
      observeEvent(input$erp_item_intial_newRead,{
        data <-try(vmrdspkg::item_selectValue_ERP2PLM_newRead(conn_erp = conn_erp,conn_plm = conn_plm))
        
        run_dataTable2('erp_item_intial_newWrite_dataView',data = data)
        
      })
    
    #写入数据
      observeEvent(input$erp_item_intial_newWrite,{
        try(vmrdspkg::item_selectValue_ERP2PLM_newWrite(conn_erp = conn_erp,conn_plm = conn_plm))
        
        

        
      })
    
    
    # 2 bom-----
    
    run_download_xlsx(id = 'ERP_BOM_TPL_DL',data = bom_data,filename = 'BOM导入模板.xlsx')
    
    
    var_ERP_BOM_FILE = var_file("ERP_BOM_FILE")
    observeEvent(input$ERP_BOM_DONE,{
      ERP_BOM_FILE_param = var_ERP_BOM_FILE()
      data_file = readxl::read_excel(ERP_BOM_FILE_param, 
                                     sheet = "BOM")
      FNumbers = data_file[ ,'BOM顶层物料编码',drop =TRUE]
      print(FNumbers)
      try(vmrdspkg::ERPtoPLM_BOM_ALL(conn_erp = conn_erp,conn_plm = conn_plm,FNumbers = FNumbers))
      pop_notice('初始化BOM成功写入PLM！')
      
      
      
    })
    
    
    #2.2 bom one---
    var_ERP_BOM_FNumber_one <- var_text('ERP_BOM_FNumber_one')
    observeEvent(input$ERP_BOM_DONE_one,{
      #导入单个BOM进行判断与提示
      
      
      shinyjs::disable('ERP_BOM_DONE_one')
    
      FNumber = var_ERP_BOM_FNumber_one()
      FInfo = vmrdspkg::ERP_BOM_preCheck(conn = conn_erp,FNumber = FNumber)
      if( FInfo  ==  0){
        txt = paste0(FNumber,"物料不存在")
      }
      if( FInfo ==1){
        txt = paste0(FNumber,"BOM不存在")
      }
      
      if ( FInfo ==2){
        try(vmrdspkg::ERPtoPLM_BOM_one(conn_erp = conn_erp,conn_plm = conn_plm,FNumber = FNumber))
        txt <- paste0(FNumber,':初始化BOM成功写入PLM！')
      }
      print(FNumber)
     
      pop_notice(txt)
      
      
      
    })
    
    #再次激活导入----
    observeEvent(input$ERP_BOM_DONE_one_reset,{
      shinyjs::enable('ERP_BOM_DONE_one')
      
    })
    
    
   #2.3物料属性批量修改-----
    
    var_mtrl_fp_file <- var_file('mtrl_fp_file')
    observeEvent(input$mtrl_fp_preview,{
      file <- var_mtrl_fp_file()
      print(file)
      if(!is.null(file)){
        sheet <- input$mtrl_fp_sheetName
        data <- vmrdspkg::erp_materia_read(file=file,sheet = sheet)
        run_dataTable2('mtrl_fp_dataTable',data = data)
      }else{
        pop_notice('请选择物料属性修改文件,然后上传')
      }
   
      
    })
    
    observeEvent(input$mtrl_fp_update,{
      shinyjs::disable('mtrl_fp_update')
      file <- var_mtrl_fp_file()
      sheet <- input$mtrl_fp_sheetName
      try({
        #上传数据进入服务器
        print('1')
        data <- vmrdspkg::erp_materia_read(file=file,sheet = sheet,lang = 'en',conn = conn_erp)
        #检验数据状态
        print('2')
        vmrdspkg::erp_checkItemUseStatus(conn = conn_erp)
        #更新数据
        print('3')
        #vmrdspkg::erp_updateItem_plmMode(conn = conn_erp)
        #更新相相应的函数，追加了一些功能，如更新计量单位
        vmrdspkg::erp_updateItem_erpMode (conn = conn_erp)
          
        
      })
      # 待更新通知信息,来源于采购订单及库存单据等
      pop_notice("更新物料成功!")
      
    })
    
    #再次激活物料相关按纽-------
    observeEvent(input$mtrl_fp_update_reset,{
      shinyjs::enable('mtrl_fp_update')
      
      
      
      
    })
    
    
    
    # 物料属性处理
    var_mtrl_dates <- var_dateRange('mtrl_dates')
    observeEvent(input$mtrl_getItem_fromPLM,{
      dates <- var_mtrl_dates()
      FStartDate <- as.character(dates[1])
      FEndDate <- as.character(dates[2])
      data <- vmrdspkg::erp_getItemListFromPlm(conn = conn_erp,FStartDate =FStartDate ,FEndDate =FEndDate ) 
      run_dataTable2('mtrl_fp_dataTable',data = data)
      #针对获取到的数据进行进一步的处理
      data_dl <- list(data)
      names(data_dl) <-'物料'
      run_download_xlsx('mtrl_downloadItem_fromPLM',data = data_dl,filename = 'PLM传入ERP物料数据.xlsx')
      
      
    })
    
    #设置数据库的连接信息----
    var_conn_erp_ip <- var_text('conn_erp_ip')
    var_conn_erp_port <- var_text('conn_erp_port')
    var_conn_erp_user_name <- var_text('conn_erp_user_name')
    var_conn_erp_password <- var_password('conn_erp_password')
    var_conn_erp_db_name <- var_text('conn_erp_db_name')
    observeEvent(input$conn_erp_test,{
      #设置相关信息
      ip <- var_conn_erp_ip()
      port <- as.numeric(var_conn_erp_port())
      user_name = var_conn_erp_user_name()
      password = var_conn_erp_password()
      db_name = var_conn_erp_db_name()
      print(ip)
      print(port)
      
      #结果结果进行处理
      
      result = tryCatch ( {
        #只有变化时再测试连接，否则停止不断尝试
        isolate({
         conn_test <-  tsda::sql_conn_common(ip = ip,user_name = user_name,password = password,db_name = db_name,port = port)
        sql_test <- "select 1 as FCount"
        data_test <- tsda::sql_select(conn_test,sql_test)
        ncount_test <- nrow(data_test)
        if(ncount_test >0){
          pop_notice('测试成功')

        }
        })
        
      } , warning = function ( w ) {
        
        print('warning')
        
      } , error = function ( e ) {
        
        pop_notice('测试失败,请刷新程序后重试！')
        # 停止程序
         stop(e)
        
      } , finally = {
        
       
        
      })
      
   

     
      
      
      
    })

    
    observeEvent(input$conn_erp_setting,{
      #设置相关信息
      ip <- var_conn_erp_ip()
      port <- var_conn_erp_port()
      user_name = var_conn_erp_user_name()
      password = var_conn_erp_password()
      db_name = var_conn_erp_db_name()
      
      result = tryCatch ( {
        #只有变化时再测试连接，否则停止不断尝试
        isolate({
          conn_test <-  tsda::sql_conn_common(ip = ip,user_name = user_name,password = password,db_name = db_name,port = port)
          sql_test <- "select 1 as FCount"
          data_test <- tsda::sql_select(conn_test,sql_test)
          ncount_test <- nrow(data_test)
          if(ncount_test >0){
            
            #设置链接
            
            vmrdspkg::conn_config_write(file_name = "config/conn_erp.xlsx",
                                        ip = ip,
                                        port = port,user_name = user_name,password = password,db_name = db_name
                                        )
            pop_notice('设置成功')
            
          }
        })
        
      } , warning = function ( w ) {
        
        print('warning')
        
      } , error = function ( e ) {
        
        pop_notice('测试失败,请刷新程序后重试！')
        # 停止程序
        stop(e)
        
      } , finally = {
        
        
        
      })
      
      
     
      
    })
    
    #设置plm连接
    var_conn_plm_ip <- var_text('conn_plm_ip')
    var_conn_plm_port <- var_text('conn_plm_port')
    var_conn_plm_user_name <- var_text('conn_plm_user_name')
    var_conn_plm_password <- var_password('conn_plm_password')
    var_conn_plm_db_name <- var_text('conn_plm_db_name')
    observeEvent(input$conn_plm_test,{
      #设置相关信息
      ip <- var_conn_plm_ip()
      port <- as.numeric(var_conn_plm_port())
      user_name = var_conn_plm_user_name()
      password = var_conn_plm_password()
      db_name = var_conn_plm_db_name()
      print(ip)
      print(port)
      
      #结果结果进行处理
      
      result = tryCatch ( {
        #只有变化时再测试连接，否则停止不断尝试
        isolate({
          conn_test <-  tsda::sql_conn_common(ip = ip,user_name = user_name,password = password,db_name = db_name,port = port)
          sql_test <- "select 1 as FCount"
          data_test <- tsda::sql_select(conn_test,sql_test)
          ncount_test <- nrow(data_test)
          if(ncount_test >0){
            pop_notice('测试成功')
            
          }
        })
        
      } , warning = function ( w ) {
        
        print('warning')
        
      } , error = function ( e ) {
        
        pop_notice('测试失败,请刷新程序后重试！')
        # 停止程序
        stop(e)
        
      } , finally = {
        
        
        
      })
      
      
      
      
      
      
      
    })
    
    
    observeEvent(input$conn_plm_setting,{
      #设置相关信息
      ip <- var_conn_plm_ip()
      port <- var_conn_plm_port()
      user_name = var_conn_plm_user_name()
      password = var_conn_plm_password()
      db_name = var_conn_plm_db_name()
      
      result = tryCatch ( {
        #只有变化时再测试连接，否则停止不断尝试
        isolate({
          conn_test <-  tsda::sql_conn_common(ip = ip,user_name = user_name,password = password,db_name = db_name,port = port)
          sql_test <- "select 1 as FCount"
          data_test <- tsda::sql_select(conn_test,sql_test)
          ncount_test <- nrow(data_test)
          if(ncount_test >0){
            
            #设置链接
            
            vmrdspkg::conn_config_write(file_name = "config/conn_plm.xlsx",
                                        ip = ip,
                                        port = port,user_name = user_name,password = password,db_name = db_name
            )
            pop_notice('设置成功')
            
          }
        })
        
      } , warning = function ( w ) {
        
        print('warning')
        
      } , error = function ( e ) {
        
        pop_notice('测试失败,请刷新程序后重试！')
        # 停止程序
        stop(e)
        
      } , finally = {
        
        
        
      })
      
      
      
      
    })
    
    #自动同步设置------
    
    var_cron_time_item <- var_integer('cron_time_item')
    var_cron_time_bom <- var_integer('cron_time_bom')
    observeEvent(input$cron_time_bom_set,{
      #同步BOM
      time_bom =  var_cron_time_bom()
      print(time_bom)
      # vmrdspkg::cron_set(r_file = cron_bom_file,time = time_bom,id = 'job_bom',description = '同步BOM至ERP')
      pop_notice(paste0('BOM同步间隔',time_bom,'分钟一次!,重启后端服务后生效'))
      
      
    })
    observeEvent(input$cron_time_item_set,{
      #同步物料
      time_item = var_cron_time_item()
      print(time_item)
      #vmrdspkg::cron_set(r_file = cron_item_file,time = time_item,id = 'job_item',description = '同步物料至ERP')
      
      pop_notice(paste0('物料同步间隔',time_item,'分钟一次!,重启后端服务后生效'))
    })
    #日志分析
    var_log_dates_1 <- var_dateRange('log_dates_1')
    observeEvent(input$log_query1,{
      dates = var_log_dates_1()
      data_summary <- vmrdspkg::log_summary(conn = conn_erp,FTableName = 'rds_vw_log_ERPtoPLM_Item_summary',
                                            FStartDate = dates[1],FEndDate = dates[2])
      filter_date1 <- reactiveVal(value = NULL)
      
      # Update the filter date on click on data point
      observeEvent(input$chart1_clicked_data, {
        filter_date1(input$chart1_clicked_data$value[1])
      })
      # Create an interactive chart
      output$chart1 <- renderEcharts4r({
        data_summary %>% 
          e_charts(FLogDate) %>% 
          e_line(
            serie = FCount, 
            name = '物料数',
            symbolSize = 12
          ) %>% 
          e_tooltip(axisPointer = list(type = 'cross')) %>% 
          e_axis_labels(y = '物料数')
      })
      
      # Create a table with detailed information
      output$dt1 <- renderDT({
        if (!is.null(filter_date1())) {
          data <- vmrdspkg::log_detail(conn = conn_erp,FTableName = 'rds_vw_log_ERPtoPLM_Item_detail',FLogDate =     filter_date1())
          datatable(
            data, 
            selection = 'none', 
            rownames = FALSE,
            options = list(dom = 'tip') # select table elements to show
          )
        }
        
    
      })
      
      
      
    })
    #LOG2
    var_log_dates_2 <- var_dateRange('log_dates_2')
    observeEvent(input$log_query2,{
      dates = var_log_dates_2()
      data_summary <- vmrdspkg::log_summary(conn = conn_erp,FTableName = 'rds_vw_log_ERPtoPLM_BOM_summary',FStartDate = dates[1],FEndDate = dates[2])
      filter_date2 <- reactiveVal(value = NULL)
      
      # Update the filter date on click on data point
      observeEvent(input$chart2_clicked_data, {
        filter_date2(input$chart2_clicked_data$value[1])
      })
      # Create an interactive chart
      output$chart2 <- renderEcharts4r({
        data_summary %>% 
          e_charts(FLogDate) %>% 
          e_line(
            serie = FCount, 
            name = 'BOM数',
            symbolSize = 12
          ) %>% 
          e_tooltip(axisPointer = list(type = 'cross')) %>% 
          e_axis_labels(y = 'BOM数')
      })
      
      # Create a table with detailed information
      output$dt2 <- renderDT({
        if (!is.null(filter_date2())) {
          data <- vmrdspkg::log_detail(conn = conn_erp,FTableName = 'rds_vw_log_ERPtoPLM_BOM_detail',FLogDate =     filter_date2())
          datatable(
            data, 
            selection = 'none', 
            rownames = FALSE,
            options = list(dom = 'tip') # select table elements to show
          )
        }
        
        
      })
      
      
      
    })
    #LOG3
    var_log_dates_3 <- var_dateRange('log_dates_3')
    observeEvent(input$log_query3,{
      dates = var_log_dates_3()
      data_summary <- vmrdspkg::log_summary(conn = conn_erp,FTableName = 'rds_vw_log_PLMtoERP_Item_summary',FStartDate = dates[1],FEndDate = dates[2])
      filter_date3 <- reactiveVal(value = NULL)
      
      # Update the filter date on click on data point
      observeEvent(input$chart3_clicked_data, {
        filter_date3(input$chart3_clicked_data$value[1])
      })
      # Create an interactive chart
      output$chart3 <- renderEcharts4r({
        data_summary %>% 
          e_charts(FLogDate) %>% 
          e_line(
            serie = FCount, 
            name = '物料数',
            symbolSize = 12
          ) %>% 
          e_tooltip(axisPointer = list(type = 'cross')) %>% 
          e_axis_labels(y = '物料数')
      })
      
      # Create a table with detailed information
      output$dt3 <- renderDT({
        if (!is.null(filter_date3())) {
          data <- vmrdspkg::log_detail(conn = conn_erp,FTableName = 'rds_vw_log_PLMtoERP_Item_detail',FLogDate =     filter_date3())
          datatable(
            data, 
            selection = 'none', 
            rownames = FALSE,
            options = list(dom = 'tip') # select table elements to show
          )
        }
        
        
      })
      
      
      
    })
    #L0G4
    var_log_dates_4 <- var_dateRange('log_dates_4')
    observeEvent(input$log_query4,{
      dates = var_log_dates_4()
      data_summary <- vmrdspkg::log_summary(conn = conn_erp,FTableName = 'rds_vw_log_PLMtoERP_BOM_summary',FStartDate = dates[1],FEndDate = dates[2])
      filter_date4 <- reactiveVal(value = NULL)
      
      # Update the filter date on click on data point
      observeEvent(input$chart4_clicked_data, {
        filter_date4(input$chart4_clicked_data$value[1])
      })
      # Create an interactive chart
      output$chart4 <- renderEcharts4r({
        data_summary %>% 
          e_charts(FLogDate) %>% 
          e_line(
            serie = FCount, 
            name = 'BOM数',
            symbolSize = 12
          ) %>% 
          e_tooltip(axisPointer = list(type = 'cross')) %>% 
          e_axis_labels(y = 'BOM数')
      })
      
      # Create a table with detailed information
      output$dt4 <- renderDT({
        if (!is.null(filter_date4())) {
          data <- vmrdspkg::log_detail(conn = conn_erp,FTableName = 'rds_vw_log_PLMtoERP_BOM_detail',FLogDate =     filter_date4())
          datatable(
            data, 
            selection = 'none', 
            rownames = FALSE,
            options = list(dom = 'tip') # select table elements to show
          )
        }
        
        
      })
      
      
      
    })
    #进行分析
    var_icmo_bom_ppbom_number <- var_text(id = 'icmo_bom_ppbom_number')
    observeEvent(input$icmo_bom_ppbom_number_btn,{
      fbillno =  var_icmo_bom_ppbom_number()
      data <- vmrdspkg::rpt_icmo_ppbom_diff_number(conn = conn_erp,fbillno = fbillno)
      run_dataTable2('icmo_bom_ppbom_number_btn_dataTable',data = data)
      var_file_name = paste0('下达状态的生产任务投料单及BOM差异分析_按任务单号_',fbillno,'.xlsx')
      run_download_xlsx(id = 'icmo_bom_ppbom_number_dl',data = data,filename = var_file_name)
      
      
    })
    
    
    var_icmo_bom_ppbom_item <- var_text(id = 'icmo_bom_ppbom_item')
    observeEvent(input$icmo_bom_ppbom_item_btn,{
      FNumber =  var_icmo_bom_ppbom_item()
      data <- vmrdspkg::rpt_icmo_ppbom_diff_Item(conn = conn_erp,fnumber = FNumber) 
      run_dataTable2('icmo_bom_ppbom_item_btn_dataTable',data = data)
      var_file_name = paste0('下达状态的生产任务投料单及BOM差异分析_按物料代码_',FNumber,'.xlsx')
      run_download_xlsx(id = 'icmo_bom_ppbom_item_dl',data = data,filename = var_file_name)
      
      
    })
   
  
})
