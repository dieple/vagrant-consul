#
# nodes.pp - defines all puppet nodes
#

# self-manage the puppet master server
node 'puppet' { }

node default {
  package { 'unzip':
    ensure => 'installed',
  }
}

##### CLIENTS

node 'consul1' {
  class { '::consul':
    config_hash => {
      'data_dir'         => '/opt/consul',
      'datacenter'       => 'eu-west1',
      'log_level'        => 'INFO',
      'node_name'        => 'consul1.example.com',
      'server'           => true,
      'ui_dir'           => '/opt/consul/ui',
      'client_addr'      => '0.0.0.0',
      'bootstrap'        => true,
      'enable_syslog'    => true,
      'client_addr'      => '0.0.0.0'
    }
  }
}

node 'consul2' {
  class { '::consul':
    config_hash => {
      'data_dir'         => '/opt/consul',
      'datacenter'       => 'eu-west1',
      'log_level'        => 'INFO',
      'node_name'        => 'consul2.example.com',
      'server'           => true,
      'ui_dir'           => '/opt/consul/ui',
      'client_addr'      => '0.0.0.0',
      'bootstrap'        => false,
      'enable_syslog'    => true,
      'client_addr'      => '0.0.0.0',
      'start_join'       => ['172.16.32.20', '172.16.32.40'],
    }
  }
}

node 'consul3' {
  class { '::consul':
    config_hash => {
      'data_dir'         => '/opt/consul',
      'datacenter'       => 'eu-west1',
      'log_level'        => 'INFO',
      'node_name'        => 'consul2.example.com',
      'server'           => true,
      'ui_dir'           => '/opt/consul/ui',
      'client_addr'      => '0.0.0.0',
      'bootstrap'        => false,
      'enable_syslog'    => true,
      'client_addr'      => '0.0.0.0',
      'start_join'       => ['172.16.32.20', '172.16.32.30'],
    }
  }
}

node 'client1' {
  class { '::consul':
    config_hash => {
      'data_dir'         => '/opt/consul',
      'datacenter'       => 'eu-west1',
      'log_level'        => 'INFO',
      'node_name'        => 'client1.example.com',
      'server'           => false,
      'pretty_config'    => true,
      'retry_join'       => ['172.16.32.10'],
    }
  }
}

node 'client2' {
  class { '::consul':
    config_hash => {
      'data_dir'         => '/opt/consul',
      'datacenter'       => 'eu-west1',
      'log_level'        => 'INFO',
      'node_name'        => 'client2.example.com',
      'server'           => false,
      'pretty_config'    => true,
      'retry_join'       => ['172.16.32.10'],
    }
  }
}
