class ssm_agent::install (
  String $ssm_tmp_file  = '/tmp/ssm_agent.install',
  String $ssm_agent_url,
  String $provider,
){
  exec { 'download_ssm-agent':
    command => "/usr/bin/wget -T60 -N ${ssm_agent_url} -O ${ssm_tmp_file}",
    path    => '/bin:/usr/bin:/usr/local/bin:/usr/sbin',
    creates => $ssm_tmp_file
  }

  package { 'ssm_agent':
    provider  => $provider,
    source    => $ssm_tmp_file,
    subscribe => Exec['download_ssm-agent'],
  }
}