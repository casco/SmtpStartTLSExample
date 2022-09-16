Class {
	#name : #MailSenderComponent,
	#superclass : #WAComponent,
	#instVars : [
		'server',
		'port',
		'username',
		'password',
		'to',
		'subject',
		'text'
	],
	#category : #SmtpStartTLSExample
}

{ #category : #rendering }
MailSenderComponent >> renderContentOn: html [

	html form: [ 
		self renderServerConfigurationOn: html.
		self renderEmailContentOn: html.
		html submitButton
			callback: [ self send ];
			value: 'Send' ]
]

{ #category : #rendering }
MailSenderComponent >> renderEmailContentOn: html [

	html heading: 'Email'.
	html paragraph: [ 
		html text: 'to: '.
		html textInput
			callback: [ :value | to := value ];
			value: to ].
	html paragraph: [ 
		html text: 'subject: '.
		html textInput
			callback: [ :value | subject := value ];
			value: subject ].
	html paragraph: [ 
		html text: 'text: '.
		html textInput
			callback: [ :value | text := value ];
			value: text ]
]

{ #category : #rendering }
MailSenderComponent >> renderServerConfigurationOn: html [

	html heading: 'Server config'.
	html paragraph: [ 
		html text: 'server ip: '.
		html textInput
			callback: [ :value | server := value ];
			value: server ].
	html paragraph: [ 
		html text: 'server port: '.
		html textInput
			callback: [ :value | port := value ];
			value: port ].
	html paragraph: [ 
		html text: 'username: '.
		html textInput
			callback: [ :value | username := value ];
			value: username ].
	html paragraph: [ 
		html text: 'pasword: '.
		html textInput
			callback: [ :value | password := value ];
			value: password ]
]

{ #category : #rendering }
MailSenderComponent >> send [

	| theSmtpClient mailMessage |
	(theSmtpClient := ZdcSecureSMTPClient new)
		useStartTLS;
		user: username;
		password: password.

	theSmtpClient
		openOnHost: (NetNameResolver addressForName: server)
		port: port asNumber.

	mailMessage := MailMessage empty.
	mailMessage setField: 'subject' toString: subject.
	mailMessage body:
		(MIMEDocument contentType: 'text/plain' content: text).

	theSmtpClient
		mailFrom: username to: { to } text: mailMessage text;
		quit;
		close
]
