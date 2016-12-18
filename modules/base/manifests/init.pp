class base {
	$dnsutil = $osfamily ? { 
		'Redhat' => 'bind-utils', 
		'Debian' => 'dnsutils',
	}

	#Execute update and do upgrade only if puppet runs at a specific time of the day:
	$systemupdate = $osfamily ? {
		'RedHat' => '/usr/bin/yum update -y',
		'Debian' => '/usr/bin/apt-get upgrade -y',
	}

	#Name this resource with a title
	package { ['tree','$dnsutil']:
		ensure => present,
	}
	
	schedule { 'system-daily':
		period => daily,
		range  => '00:00 - 01:00',
	}
	#The exec resource type allows us to execute commands on a linux system
	#Exec says: Execute this command based
	#Associate the exec command with the schedule
	exec { $systemupdate:  
		schedule => 'system-daily',
	}

}
