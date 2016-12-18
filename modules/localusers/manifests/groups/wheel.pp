#This class will create the wheel group and add users to it

class localusers::groups::wheel {
	#Declare a group resource for the wheel group
	#Group name = wheel
	#Ensure that the group is present on the system
	#Add these members (users) to this group: members => '',
	group { 'wheel':
		ensure  => present,
	}
	
}
