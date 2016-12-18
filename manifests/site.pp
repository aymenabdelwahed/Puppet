filebucket { 'main':
	server => 'aymen-abdelwahed-gmail-com1.mylabserver.com',
	path   => false,
}

File { backup => 'main' }

#Top level scope variable : Any variable created outside of our node definition and will be available to our nodes
$topscope = "This if from our site.pp file"

node default {
}

node "aymen-abdelwahed-gmail-com1.mylabserver.com" {
	include pe_repo::platform::ubuntu_1404_amd64
}

node /^aymen-abdelwahed-gmail-com\d{1}.mylabserver.com$/ {
	#We can reference a node scope variable within any of our classes (localusers, base ...)
	$nodescope = "Defined within our node"

	include localusers
	include localusers::groups::finance
	include localusers::groups::wheel
	include base
	include base::ssh

	include base::variables
	notify { 'This is a test notify': }
}
