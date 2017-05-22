class ssm_agent::onpremises (
  String $aws_dir,
  String $aws_config,
  String $aws_credentials,
  String $aws_access_key_id,
  String $aws_secret_access_key,
  String $aws_output,
  String $aws_region,
) {
  File {
    owner   => 'root',
    group   => 'root',
    require => Class['ssm_agent::install'],
    notify  => Class['ssm_agent::service'],
  }

  file { $aws_dir:
    ensure  => directory,
    owner   => 'root',
    mode    => '0700',
  }

  file { $aws_config:
    ensure  => file,
    content => template("${module_name}/aws/config.erb"),
  }

  file { $aws_credentials:
    ensure  => file,
    content => template("${module_name}/aws/credentials.erb"),
  }
}
