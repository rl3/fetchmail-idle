# fetchmail-idle
Simple script to fetch mails with IMAP's IDLE feature

Simply copy directory `email@example.com` to another name, fix the settings, delete file `.disabled` and start script `fetch`.

You can start the script as often you like — if a fetchmail process for an account is already started, it simply refreshes the process.

Add a cronjob that starts this script every hour to make sure crashed processes are restarted soon.

You may create account directories with `createAccounts.pl`: Copy file `accounts.conf.sample` to `accounts.conf`, add your accounts and start the script.
