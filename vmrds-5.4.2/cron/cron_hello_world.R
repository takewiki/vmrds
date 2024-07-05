library(cronR)
f <- "/home/hulilei/app/vmrds/cron/hello_world.R"

source(f)

cmd <- cron_rscript(f)
cmd

cron
cron_njobs()

cron_rm('test1')

  cron_ls('test1')
  
  cron_save('cron/test1.backup')

  cron_load("cron/test1.backup")

 bb <- cron_ls()  
bb;

cat(bb)

aa
aa$command    
