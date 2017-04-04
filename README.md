# fetchmail-idle
Simple script to fetch mails with IMAPs IDLE feature

Simply copy directory email@example.com to another directory, fix settings, delete file .disabled and start the script.

You can start the script as often you like - if it's a fetchmail process for an account already started, it simply refreshes the process.
You should run it via cron every hour or so to make sure, crashed processes are restartet soon.