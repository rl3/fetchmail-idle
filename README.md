# fetchmail-idle
Simple script to fetch mails with IMAP's IDLE feature

Simply copy directory email@example.com to another directory, fix the settings, delete file `.disabled` and start the script.

You can start the script as often you like — if a fetchmail process for an account is already started, it simply refreshes the process.

Add a cronjob every hour that starts this script to make sure crashed processes are restarted soon.

You may create account directories with `createAccounts.pl`.

You should copy file `accounts.conf.sample` to `accounts.conf` and simply start the script.
