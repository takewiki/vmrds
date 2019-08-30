sidebarMenu <-sidebarMenu(
  
 # 1.01 打补卡数据----
 menuItem("打卡数据",tabName = "checkOn",icon=icon('clock')),
 menuItem("补卡数据",tabName = "buKa",icon=icon('history')),
 # 1.01 出差外出数据----
 menuItem("出差数据",tabName = "chuChai",icon=icon('plane')),
 menuItem("外出数据",tabName = "waiChu",icon=icon('car-side')),


  # 1.02 components ----
  menuItem("加班数据", tabName = "jiaBan", icon = icon("hourglass")),
  # #1.03 outPut----
  menuItem(text = "请假数据",tabName = "qingJia",icon=icon("user-times")),
 menuItem(text = "导出数据",tabName = "exportData",icon=icon("database")),

  # #1.05 system setting ----
  menuItem(text = "系统设置",tabName = "sysSetting",icon=icon("cog"),
           sidebarMenu(
             #1.05.01 settingParam----
             menuItem(text="网商日历",tabName = "calendar",icon = icon("calendar-alt")),
             #1.05.02 settingUser----
             menuItem(text="花名对照",tabName = "settingUser",icon = icon("user-friends"))
           ))
  
  
)
