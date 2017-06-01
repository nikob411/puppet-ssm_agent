class ssm_agent::service inherits ssm_agent {
  if $ssm_agent::manage_service {
    case $facts['osfamily'] {
      'Debian': {
        service { $ssm_agent::service_name:
          ensure    => running,
          subscribe => Package['ssm_agent'],
          require   => Class['ssm_agent::install'],
        }
      }
      default: {
        service { $ssm_agent::service_name:
          ensure     => running,
          hasstatus  => true,
          hasrestart => true,
          restart    => "/sbin/restart ${ssm_agent::service_name}",
          start      => "/sbin/start ${ssm_agent::service_name}",
          status     => "/sbin/status ${ssm_agent::service_name}",
          stop       => "/sbin/stop ${ssm_agent::service_name}",
          subscribe  => Package['ssm_agent'],
          require    => Class['ssm_agent::install'],
        }
      }
    }
  }
}