class base::if {
	#Be prepared to evaluate a regular expression; Everything that starts with 'aymen' and followed by a digit or more will match our regex pattern and perform this code:
	if $::hostname =~ /^aymen(\d+)/  {
	#If our hostname contain aymen02, then $0 will contain 'aymen02' and will be displayed:
		notice ("You are arrived at server $0 ")
	}
}
