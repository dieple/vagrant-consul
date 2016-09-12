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

##### CONSUL SERVERS

node 'consul1' {
  class { '::consul':
    config_hash => {
      'bootstrap_expect' => 1,
      'client_addr'      => '0.0.0.0',
      'data_dir'         => '/opt/consul',
      'datacenter'       => 'eu-west1',
      'log_level'        => 'INFO',
      'node_name'        => 'consul1.example.com',
      'server'           => true,
      'ui_dir'           => '/opt/consul/ui',
      'enable_syslog'    => true,
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
      'retry_join'       => ['172.16.32.20'],
      'enable_syslog'    => true,
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
      'retry_join'       => ['172.16.32.20'],
      'enable_syslog'    => true,
    }
  }
}

