# Raise Nginx's open-file limit so it can handle high concurrency
exec { 'fix--for-nginx':
  command => 'sed -i "s/15/4096/" /etc/default/nginx',
  path    => ['/bin', '/usr/bin', '/usr/sbin'],
}

# Restart Nginx so the new limit takes effect
exec { 'restart-nginx':
  command     => 'service nginx restart',
  path        => ['/bin', '/usr/bin', '/usr/sbin'],
  subscribe   => Exec['fix--for-nginx'],
  refreshonly => true,
}
