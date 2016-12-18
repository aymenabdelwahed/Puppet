#The first file must always be init.pp
#The class name should the same as the directory name of our module: if it's not it will show error when applying conf

class filedemo{

	#Specify DEFAULT resources
	#Ex: Add specific file and we want that these files have a specific group & permissions
	#In order to describe or initiate a file resource we use 'File'
	File {
		owner => 'root',
		group => 'finance',
		mode => '0660',
	}

	$homedir = "/root"
	$content = "myu files content"
	#Use "" to interpolate variables into the string.:
	file { "${homedir}/myfile.txt" :
		#Set the content of the file to $content value
		content => $content,
	}

	file { "${homedir}/myfile2.txt":
		content => "my file2 content",
	}

	file { "${homedir}/myfile3.txt":
		content => "myfile3",
		owner => admin,
		group => root,
	}

	file { '/root/motd':
		ensure  => present,
		#content => "This is my motdfile mnanaged by content attribute",
		source  => 'puppet:///modules/filedemo/motd',
		owner   => root,
		group   => root,
		mode    => '0644',
	}
	
	file { '/etc/motd':
		ensure => link,
		target => '/root/motd',
	}
}
