name              'consul'
maintainer        'Sous Chefs'
maintainer_email  'help@sous-chefs.org'
license           'Apache-2.0'
description       'Application cookbook which installs and configures Consul.'
source_url        'https://github.com/sous-chefs/consul'
issues_url        'https://github.com/sous-chefs/consul/issues'
chef_version      '>= 15.3'
version           '6.0.0'

supports 'centos', '>= 7.0'
supports 'redhat', '>= 7.0'
supports 'debian', '>= 9.0'
supports 'ubuntu', '>= 16.04'
supports 'windows'

# depends 'nssm', '>= 5.1.0' # want to get rid of this tool where the most recent version is from 2017
