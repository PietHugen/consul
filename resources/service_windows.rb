provides :consul_service, os: 'windows'
unified_mode true

property :config_file, String, default: lazy { node['consul']['config']['path'] }
property :user, String, default: lazy { node['consul']['service_user'] }
property :group, String, default: lazy { node['consul']['service_group'] }
property :environment, Hash, default: {}
property :data_dir, String, default: lazy { node['consul']['config']['data_dir'] }
property :config_dir, String, default: lazy { node['consul']['config_dir'] }
# property :nssm_params, Hash, default: lazy { node['consul']['service']['nssm_params'] }
property :systemd_params, Hash, default: lazy { node['consul']['service']['systemd_params'] }
property :program, String, default: '/usr/local/bin/consul'
property :acl_token, String, default: lazy { node['consul']['config']['acl_master_token'] }
property :restart_on_update, [true, false], default: true

action_class do
  include ConsulCookbook::Helpers
end

action :enable do
  windows_service 'consul' do
    binary_path_name "\"#{new_resource.program}\" agent -config-file=\"#{new_resource.config_file}\" -config-dir=\"#{new_resource.config_dir}\""
    startup_type :automatic
    action :create
  end
end

action :start do
  powershell_script 'consul' do
    code 'start-service consul'
  end
end

action :reload do
  powershell_script 'Restart consul' do
    code 'restart-service consul'
  end
end

action :restart do
  powershell_script 'Restart consul' do
    code 'restart-service consul'
  end
end

action :disable do
  nssm 'consul' do
    action %i(stop remove)
  end
end
