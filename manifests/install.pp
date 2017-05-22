class ssm_agent::install inherits ssm_agent {
  if $ssm_agent::proxy_install_manage {
    exec { 'download_ssm-agent':
      command => "/usr/bin/curl -x $ssm_agent::http_proxy --connect-timeout $ssm_agent::proxy_install_manage_timeout -o $ssm_agent::ssm_tmp_file -O $ssm_agent::ssm_agent_url",
      path    => '/bin:/usr/bin:/usr/local/bin:/usr/sbin',
      creates => $ssm_agent::ssm_tmp_file
    }
  }
  else {
    exec { 'download_ssm-agent':
      command => "/usr/bin/curl -o $ssm_agent::ssm_tmp_file --connect-timeout $ssm_agent::proxy_install_manage_timeout -O $ssm_agent::ssm_agent_url",
      path    => '/bin:/usr/bin:/usr/local/bin:/usr/sbin',
      creates => $ssm_agent::ssm_tmp_file
    }
  }

  package { 'ssm_agent':
    name      => $ssm_agent::package_name,
    ensure    => 'installed',
    provider  => $ssm_agent::package_provider,
    source    => $ssm_agent::ssm_tmp_file,
    subscribe => Exec['download_ssm-agent'],
  }
}