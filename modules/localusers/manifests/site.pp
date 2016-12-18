#The default node definition matches any node lacking a more specific node definition:

node default {
	
}

#If the node PuppetMaster
node "aymen-abdelwahed-gmail-com1.mylabserver.com" {
	#The following class is already included in our puppet module:
	#To use it:	
	
	include pe_repo::platform::ubuntu_1404_amd64

	#Which will allow to include our puppet agent to our puppet master
}

# Add a definition for the node we are working with:
# #Manage nodes with the following regex:
node /^aymen-abdelwahed-gmail-com\d{1}.mylabserver.com$/ {
	include localusers
	include localusers::groups::wheel
	include localusers::groups::finance

	include base
	include base::ssh

	notify { 'This is a test notify':  }

}

