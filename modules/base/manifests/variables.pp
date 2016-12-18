class base::variables {
	file { '/root/var_test.txt':
		content => $topscope,
		owner   => 'root',
		group   => 'root',
		mode    => '0644',
	}

	notify { "${operatingsystem} is your operating system": }
}
