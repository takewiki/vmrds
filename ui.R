


# 1.00  shinyUI start point----

shinyUI(dashboardPage(skin = "blue",
                    
                
                    
                    dashboardHeader(title = "网商HR数据中台",
                                   
                                    headerMsg1,
                                    dynamicMsgMenu,
                                    NotiMenuObj,
                                    disable = F
                    ),
                    
                    #ui.sideBar----
                    dashboardSidebar(
                    
                       sidebarMenu
                    ),
                    
                    #ui.body----
                    dashboardBody(
                      workAreaSetting
                    )
)
)


