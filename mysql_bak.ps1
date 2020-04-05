# ------------ Task Schedule windows定时任务----------------
# 1. 创建定时任务
# 2. Start Action=powershell, arguments=bak_bpi_db.ps1

# powershell特殊字符前可以加`
# ------------- 第一种方式 ---------------
$my_sql="d:\mysql_bak\" + (Get-Date -Format 'yyyy-MM-dd_HH-mm') + ".sql"
$my_dump="C:/Program Files/MySQL/MySQL Server 5.7/bin/mysqldump.exe"
& $my_dump `
    --host=localhost --port=3306 --user=root --password=mypassword
    --result-file=$my_sql --single-transaction=TRUE --databases itdesk
