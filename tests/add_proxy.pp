class { '::ssm_agent':
  proxy    => 'http://proxy.com:3128',
  no_proxy => '169.254.169.254',
}
