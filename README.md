# SmtpStartTLSExample

```Smalltalk
Metacello new
	baseline: 'SmtpStartTLSExample';
	repository: 'github://casco/SmtpStartTLSExample';
	onConflictUseLoaded;
	load.
	
app := WAAdmin register: MailSenderComponent asApplicationAt: 'sendmail'.
app configuration addParent: WAEmailConfiguration instance.
app preferenceAt: #smtpUsername  put: 'your-username'.
app preferenceAt: #smtpPassword  put: 'yourpassword'.
app preferenceAt: #smtpServer  put: 'smtp-server'.
app preferenceAt: #smtpPort  put: 587.
  ``` 
