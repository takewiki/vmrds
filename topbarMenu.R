# 0.01 add the 1st msg notification Menu----
headerMsg1<-  dropdownMenu(type = "messages",
                           messageItem(
                             from = "人力资源部",
                             message = "7月工资表已完成计算"
                           ),
                           messageItem(
                             from = "数据部",
                             message = "HR功能已更新到V2",
                             icon = icon("question"),
                             time = "13:45"
                           ),
                           messageItem(
                             from = "技术支持",
                             message = "新的HR数据中台已上线.",
                             icon = icon("life-ring"),
                             time = "2019-08-26"
                           )
);



# 0.02 add the dynamic menu ----

dynamicMsgMenu <-dropdownMenuOutput("messageMenu")

# 0.03 Notification Menu ----

NotiMenuObj <-dropdownMenu(type = "notifications",
                           notificationItem(
                             text = "花名对照表需要更新",
                             icon("users")
                           ),
                           notificationItem(
                             text = "打卡数据优化班制",
                             icon("truck"),
                             status = "success"
                           )
                           
)
# 0.04 task menu bar ----
taskMenuObj <- dropdownMenu(type = "tasks", badgeStatus = "success",
                            taskItem(value = 90, color = "green",
                                     "Documentation"
                            ),
                            taskItem(value = 70, color = "aqua",
                                     "Project X"
                            ),
                            taskItem(value = 75, color = "yellow",
                                     "Server deployment"
                            ),
                            taskItem(value = 80, color = "red",
                                     "Overall project"
                            )
)
