class ssm_agent::config (
  String $systemd_file       = '/etc/systemd/system/amazon-ssm-agent.service',
  String[Optional] $proxy    = undef,
  String[Optional] $no_proxy = undef,
){
  if $proxy or $no_proxy {
    file { $systemd_file:
      ensure  => file,
      content => template("${module_name}/amazon-ssm-agent.service.erb"),
    }
  }
}