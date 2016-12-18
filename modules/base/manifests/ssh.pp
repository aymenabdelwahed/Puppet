#Create a new class = new file
#We add base::ssh because our 'base' class is already defined in th 'init.pp' file

class base::ssh {

	#Evaluate the OSFAMILY first using facter..
	#case $osfamily {
	#	'RedHat': { $ssh_name = 'sshd' }
	#	'Debian': { $ssh_name = 'ssh' }
	#	default: { Warning('OS not supported') }
		#default: { fail('OS not supported') }
	#}

	$ssh_name = $osfamily ? {
		'RedHat' => 'sshd',
		'Debian' => 'ssh',
		default => 'value',
	}

	#The resource name is openssh-package
	#The package name is openssh; which is the real package to install; Ensure that the package openssh is installed..
	package { 'openssh-package':
		name   => 'openssh-server',
		ensure => present,
		#3before => File['/etc/ssh/sshd_config'],
	}

	#Can not mange the file if the package is not installed yet!!
	#puppet:///	> references our puppet master with the 3 /
	file { '/etc/ssh/sshd_config':
		ensure  => file,
		owner   => 'root',
		group   => 'root',
		source  => 'puppet:///modules/base/sshd_config',
		require => Package['openssh-package'],
		notify  => Service['ssh-service'],
	}

	#This service will be restarted if the file was modified
	#Regardless of the real service name or the operating system, the service which has the name $ssh_name will be started as requested...
	#When the service receives the notification it will restart the service
	service { 'ssh-service' :
		name      => $ssh_name,
		ensure    => running,
		alias     => 'ssh-service-name-two',
		enable    => true,
		#subscribe => File['/etc/ssh/sshd_config'],	
	}
}
