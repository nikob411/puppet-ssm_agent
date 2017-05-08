class ssm_agent::service(
  Boolean $manage_service,
  String $service_name,
) {
  if $manage_service {
    case $facts['os']['family'] {
      'Debian': {
        service { $service_name:
          ensure     => running,
          subscribe  => Package['ssm_agent'],
          require    => Class['ssm_agent::install'],
        }
      }
      default: {
        service { $service_name:
          ensure     => running,
          hasstatus  => true,
          hasrestart => true,
          restart    => "/sbin/restart ${service_name}",
          start      => "/sbin/start ${service_name}",
          status     => "/sbin/status ${service_name}",
          stop       => "/sbin/stop ${service_name}",
          subscribe  => Package['ssm_agent'],
          require    => Class['ssm_agent::install'],
        }
      }
    }
  }
}