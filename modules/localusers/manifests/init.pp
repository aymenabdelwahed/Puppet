class localusers {
	#Define a class = Write a code
	#Declare a class = Instanciate it

	#Declaring a class inside site.pp is classifing a class to be assigned to a specific node
	#Test the code on the local machine first: "puppet apply"
	
	#Declare a user resource: admin is the title of the resource.
	user { 'admin':
		ensure 	     => present,
		shell        => '/bin/bash',
		home         => '/home/admin',
		gid          => 'wheel',
		managehome   => 'true',
		password     => '$1$mw6uQ5i.$wWd31u1rWZPgEbyQdVBQv.',
	}
	user { 'jeff':
		ensure       => present,
		shell        => '/bin/sh',
		home         => '/home/jeff',
		groups       => ['wheel', 'finance'],
		managehome   => true,
	}
}
