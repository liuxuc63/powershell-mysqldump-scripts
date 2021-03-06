# Declare variables
$path = "/backups"                      # path of backup folder
$logFile = "automate-mysqldump.log"     # path of log file
$configFile = "others/my.cnf"           # path of my.cnf file

# Navigate to the backups folder
Set-Location $path

# get today's date to name today backup folder
$date = Get-Date -UFormat "%Y-%m-%d"

# Check for log file
# Create if not found
if (-NOT (Test-Path $logFile)) {
    New-Item -Path . -Name $logFile -ItemType "file"
    Add-Content $logFile "Created on: $date`n"
}

# enter directory
# create today's backup directory if it does not exist
if (-NOT (Test-Path $date)) {
    New-Item -ItemType "directory" $date
    Add-Content $logFile "[$date]: New $date directory is created"
}
 
# Set-Location $date
Add-Content $logFile "[$date]: Starting mysqldump"

# invoke mysqldump - insert mysqldump statement
mysqldump --defaults-file=$configFile -r $date/database-backup.sql -u root --all-databases 
Add-Content $logFile "[$date]: Backup for databases are completed"

Add-Content $logFile ""
# pause