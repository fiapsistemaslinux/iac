user { 'suporte':
  ensure     => present,
  uid        => '1001',
  gid        => '1001',
  shell      => '/bin/bash',
  home       => '/home/suporte'
}

group { 'suporte':
  ensure     => present,
  gid        => '1001',
}
