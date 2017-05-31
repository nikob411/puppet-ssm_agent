class ssm_agent::config inherits ssm_agent {
  File {
    owner   => 'root',
    group   => 'root',
    require => Class['ssm_agent::install'],
    notify  => Class['ssm_agent::service'],
  }

  if $ssm_agent::http_proxy or $ssm_agent::no_proxy {
    file { $ssm_agent::systemd_file:
      ensure  => file,
      content => template("${module_name}/amazon-ssm-agent.conf.erb"),
    }
  }
}