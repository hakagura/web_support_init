require "bundler/capistrano"

set :application, "suporte.leilaodeseminovos.com.br"
set :user, "ubuntu"
set :use_sudo, false
set :repository,  "git@codebasehq.com:aceleradora/leilao/web_support.git"
set :deploy_to, "/home/#{user}/www/#{application}"
set :deploy_via, :remote_cache
set :scm, :git
set :branch, 'master'
set :git_enable_submodules, true
set :keep_releases, 10
set :unicorn_pid, "#{shared_path}/pids/unicorn.pid"

ssh_options[:keys] = ["#{ENV['HOME']}/.ssh/amazon.pem"]

role :app, "107.20.40.77"
role :web, "107.20.40.77"
role :db,  "107.20.40.77", :primary => true

namespace :deploy do
  desc "Restart Application"
  task :restart do
    run "touch #{current_path}/tmp/restart.txt"
  end
  task :stop do; end; task :start do; end;

  desc "Make symlink for database.yml"
  task :symlink_dbyaml do
    run "ln -nfs #{shared_path}/config/database.yml #{release_path}/config/database.yml" 
  end

  desc "Make symlink for images"
  task :symlink_images do
    run "ln -nfs #{shared_path}/images/system #{release_path}/public/system" 
  end

  # desc "Populates the Production Database"
  # task :seed do
  #   run "cd #{current_path}; rake db:seed RAILS_ENV=production"
  # end
end



namespace :unicorn do
  task :start, :roles => :app, :except => { :no_release => true} do
    run "cd #{current_path} && bundle exec unicorn_rails -c #{current_path}/config/unicorn.rb -D -E production"
  end

  task :stop, :roles => :app, :except => { :no_release => true} do
    run "kill `cat #{unicorn_pid}` || true"
  end

  task :reload, :roles => :app, :except => { :no_release => true } do
    run "kill -s USR2 `cat #{unicorn_pid}` || true"
  end

  task :restart, :roles => :app, :except => { :no_release => true } do
    stop
    start
  end

  after "deploy:restart", "unicorn:restart"
end

desc "Tarefa para criar as configurações do banco em produção"
task :create_database_config do
  configs =<<-EOF
production:
  adapter: mysql2
  encoding: utf8
  reconnect: false
  database: websuport
  pool: 5
  username: rt_suport
  password: nPV5VjJZybtKq7Hr
  host: localhost
EOF
  run "mkdir -p #{shared_path}/config"
  put configs, "#{shared_path}/config/database.yml"
end

task :create_images do
  run "mkdir -p #{shared_path}/images/system"
end

after 'deploy:update_code', 'deploy:symlink_dbyaml'
# after "deploy", "deploy:seed"
after "deploy", "deploy:cleanup"
after 'deploy:setup', 'create_database_config'

