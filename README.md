# ssm_agent

#### Table of Contents

1. [Description](#description)
1. [Setup - The basics of getting started with ssm_agent](#setup)
    * [What ssm_agent affects](#what-ssm_agent-affects)
    * [Setup requirements](#setup-requirements)
    * [Beginning with ssm_agent](#beginning-with-ssm_agent)
1. [Usage - Configuration options and additional functionality](#usage)
1. [Reference - An under-the-hood peek at what the module is doing and how](#reference)
1. [Limitations - OS compatibility, etc.](#limitations)
1. [Development - Guide for contributing to the module](#development)

## Description

The ssm agent module installs, configures, and manages the AWS ssm agent service across a range of operating systems and distributions.

## Setup

### Beginning with ssm_agent

`include '::ssm_agent'` is enough to get you up and running. To pass in parameters specifying which download url to use: 

```puppet
class { '::ssm_agentntp':
  ssm_agent_url => 'https://s3.amazonaws.com/ec2-downloads-windows/SSMAgent/latest/debian_amd64/amazon-ssm-agent.deb',
}
```

## Usage

All parameters for the ntp module are contained within the main `::ssm_agent` class, so for any function of the module, set the options you want. See the common usages below for examples.

### Install and enable SSM Agent

```puppet
include '::ssm_agent'
```

### Change SSM Agent download package

```puppet
class { '::ssm_agent':
  ssm_agent_url => 'https://s3.amazonaws.com/ec2-downloads-windows/SSMAgent/latest/debian_amd64/amazon-ssm-agent.deb',
}
```

### Configuring SSM Agent to Use a Proxy

```puppet
class { '::ssm_agent':
  http_proxy  => 'http://change.proxy.com:3128',
  no_proxy    => '169.254.169.254',
}
```


### Install at On-Premises
```puppet
class { '::ssm_agent::onpremises':
  aws_access_key_id      => 'change your aws access key id',
  aws_secret_access_key  => 'change your aws secret access key',
  aws_output             => 'json',
  aws_region             => 'us-west-2'
}
```

## Reference

### Classes

#### Public classes

* ssm_agent: Main class, includes all other classes.

#### Private classes

* ssm_agent::install: Handles the packages.
* ssm_agent::config: Handles the configuration file.
* ssm_agent::service: Handles the service.
* ssm_agent::onpremises: Handles the On-Premises setting.



## Limitations

This is where you list OS compatibility, version compatibility, etc. If there
are Known Issues, you might want to include them under their own heading here.

## Development

Since your module is awesome, other users will want to play with it. Let them
know what the ground rules for contributing are.

## Release Notes/Contributors/Etc. **Optional**

If you aren't using changelog, put your release notes here (though you should
consider using changelog). You can also add any additional sections you feel
are necessary or important to include here. Please use the `## ` header.
