Smalltalk vm maxExternalSemaphoresSilently: 1024.
"Install the app"
Metacello new
	baseline: 'SmtpStartTLSExample';
	repository: 'github://casco/SmtpStartTLSExample';
	onConflictUseLoaded;
	onWarningLog;
	load.
"Disable loading of preferences"	
PharoCommandLineHandler forcePreferencesOmission: true.
"Disable Epicea"
EpMonitor reset.
NoChangesLog install.
NoPharoFilesOpener install
