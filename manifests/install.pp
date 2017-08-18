class ssm_agent::install inherits ssm_agent {
  if $ssm_agent::http_proxy {
    exec { 'download_ssm-agent':
      command => "curl -x ${ssm_agent::http_proxy} --connect-timeout ${ssm_agent::http_proxy_timeout} -o ${ssm_agent::ssm_tmp_file} -O ${ssm_agent::ssm_agent_download_url}",
      path    => '/bin:/usr/bin:/usr/local/bin:/usr/sbin',
      creates => $ssm_agent::ssm_tmp_file
    }
  }
  else {
    exec { 'download_ssm-agent':
      command => "curl -o ${ssm_agent::ssm_tmp_file} --connect-timeout ${ssm_agent::http_proxy_timeout} -O ${ssm_agent::ssm_agent_download_url}",
      path    => '/bin:/usr/bin:/usr/local/bin:/usr/sbin',
      creates => $ssm_agent::ssm_tmp_file
    }
  }

  package { 'ssm_agent':
    ensure    => 'installed',
    name      => $ssm_agent::package_name,
    provider  => $ssm_agent::package_provider,
    source    => $ssm_agent::ssm_tmp_file,
    subscribe => Exec['download_ssm-agent'],
  }
}