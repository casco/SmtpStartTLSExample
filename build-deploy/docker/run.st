WAAdmin register: MailSenderComponent asApplicationAt: 'mailsender'.
WAAdmin defaultDispatcher defaultName: 'mailsender'.

Transcript cr; show: 'Mail sender started ...'; cr; cr.
Transcript show: 'This line will be lost ... eaten by the container?'
