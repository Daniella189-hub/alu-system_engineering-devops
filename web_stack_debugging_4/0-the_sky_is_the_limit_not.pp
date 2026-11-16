# Raise Nginx's open-file limit and make sure Nginx is running afterwards
exec { 'fix--for-nginx':
  command  => 'sed -i "s/^ULIMIT=.*/ULIMIT=\"-n 4096\"/" /etc/default/nginx; service nginx stop; sleep 2; service nginx start; sleep 2',
  path     => ['/usr/local/bin', '/usr/bin', '/usr/sbin', '/bin', '/sbin'],
  provider => shell,
}
