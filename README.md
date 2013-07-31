# GeekTool scripts

Most of these are not going to be useful to you. They're coded for my dashboard.

## A note about rbenv

Some of these scripts utilise ruby. rbenv won't work with GeekTool all that happily. 
Prepend your command with the following to initialize rbenv:
```
PATH="/usr/local/bin:$PATH" && eval "$(rbenv init -)" && 
```

## The scripts

### last_exception.rb

Fetches the latest excpetions for your apps from the discontinued aTech Exceptions
app. Pass in your application key in the environment variable `KEY`

### nagios.rb

Reads some nagios status information from a custom datasource and colours them.
API key is passed in env var `KEY`

### sirportly.rb

Just displays the title of an RSS feed. Pass in the feed URL as env var `RSS_URL`

### unread_mail.scpt

Checks your email status from an open Mail.app