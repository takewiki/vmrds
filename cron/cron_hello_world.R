library(cronR)
f <- "cron/hello_world.R"

source(f)

cmd <- cron_rscript(f)
cmd

aa <- cron_add(command = cmd, frequency = 'minutely', id = 'test1', description = 'My process 1', tags = c('lab', 'xyz'))

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
