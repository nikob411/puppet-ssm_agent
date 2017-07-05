# ssm_agent
[![Build Status](https://travis-ci.org/shazi7804/puppet-ssm_agent.svg?branch=master)](https://travis-ci.org/shazi7804/ssm_agent) [![Puppet Forge](https://img.shields.io/puppetforge/dt/shazi7804/ssm_agent.svg?style=flat-square)](https://forge.puppet.com/shazi7804/ssm_agent) [![Puppet Forge](https://img.shields.io/puppetforge/v/shazi7804/ssm_agent.svg?style=flat-square)](https://forge.puppet.com/shazi7804/ssm_agent)

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
class { '::ssm_agent':
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

## Reference

### Classes

#### Public classes

* ssm_agent: Main class, includes all other classes.

#### Private classes

* ssm_agent::install: Handles the packages.
* ssm_agent::config: Handles the configuration file.
* ssm_agent::service: Handles the service.

## Parameters

The following parameters are available in the `::ssm_agent` class:

#### `ssm_agent_download_url`

Optional.

Data type: String.

The ssm agent download url

Default value: `https://s3.amazonaws.com/ec2-downloads-windows/SSMAgent/latest/$OS_VER/amazon-ssm-agent.{dev,rpm}`.

#### `proxy_install_manage`

Optional.

Data type: Boolean.

Enables the use of agents to download the source code

Default value: `false`

#### `proxy_install_manage_timeout`

Optional.

Data type: String.

Connect timeout use of agents to download the source code

Default value: `3`
