$my_sql="d:\mysql_bak\" + (Get-Date -Format 'yyyy-MM-dd_HH-mm') + ".sql"


& "C:/Program Files/MySQL/MySQL Server 5.7/bin/mysqldump.exe" `
    --host=localhost --port=3306 --user=root --password=mypassword `
    --result-file=$my_sql --single-transaction=TRUE --databases itdesk
    
