#Create different classes for each group
#Ensure that the group is created on the system; if it's not the case create it
class localusers::groups::finance {
	group { 'finance':
		ensure => present,
	}
}
