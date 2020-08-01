lock "~> 3.14.1"

set :application,	'commodre'
set :repo_url, 		'git@github.com:lugosl/commodre.git'
set :branch,:master
set :deploy_to, 	"/home/deploy/#{fetch(:application)}"
set :pty, 		true
set :deploy_via,      :remote_cache
#set :ssh_options,     forward_agent: true, user: fetch(:user), keys: %w(~/Descargas/qwikLABS-L2595-16320221.pem)
#set :ssh_options[:forward_agent] = true
#set :ssh_options, { forward_agent: true, user: fetch(:user), keys: %w(~/.ssh/id_rsa) }
set :linked_files, 	%w{config/database.yml config/secrets.yml}
set :linked_dirs, 	%w{bin log tmp/pids tmp/cache tmp/sockets vendor/bundle public/system public/uploads}
set :keep_releases, 5
set :rvm_type, :user
set :rvm_ruby_version, 	'ruby-2.5.1' # Should match ruby version

set :puma_rackup, -> { File.join(current_path, 'config.ru') }
set :puma_state, "#{shared_path}/tmp/pids/puma.state"
set :puma_pid, "#{shared_path}/tmp/pids/puma.pid"
set :puma_bind, "unix://#{shared_path}/tmp/sockets/puma.sock"    #accept array for multi-bind
set :puma_conf, "#{shared_path}/puma.rb"
set :puma_access_log, "#{shared_path}/log/puma_error.log"
set :puma_error_log, "#{shared_path}/log/puma_access.log"
set :puma_role, :app
set :puma_env, fetch(:rack_env, fetch(:rails_env, 'production'))
set :puma_threads, [0, 8]
set :puma_workers, 0
set :puma_worker_timeout, nil
set :puma_init_active_record, true
set :puma_preload_app, false
