## global.R ##
# 加载R包-----
enableBookmarking(store = "url")
library(shiny);
library(shinydashboard);
library(tsda);
library(tsdo);
library(tsui);
library(dplyr)
library(shinyjs)
library(glue)
library(shinyauthr)
library(digest)
library(shinyWidgets)
library(tsai);
library(shinyalert);
library(rclipboard);
library(DTedit);
library(vmrdspkg)
library(echarts4r)


source('00_data.R',encoding = 'utf-8');
source('01_row_body.R',encoding = 'utf-8');
source('02_column_body.R',encoding = 'utf-8');
source('03_book_body.R',encoding = 'utf-8');
#取消相应内容的加载-人工确认界面
source('04_series_body.R',encoding = 'utf-8');
source('05_majority_body.R',encoding = 'utf-8');
source('06_tutor_body.R',encoding = 'utf-8');
source('99_sysSetting_body.R',encoding = 'utf-8');
source('workAreaSetting.R',encoding = 'utf-8')










