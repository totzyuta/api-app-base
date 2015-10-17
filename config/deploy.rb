lock '3.4.0'

set :application, 'api-app'
set :repo_url, 'git@github.com:totzyuta/api-app-base.git'
set :deploy_to, '/var/rails/api-app'
set :log_level, :debug

set :linked_dirs, %w{bin log tmp/pids tmp/cache tmp/sockets vendor/bundle public/system public/assets}

# rbenv Ruby version
set :rbenv_ruby, '2.2.2'

# nokogiri はシステムライブラリを使うため bundle install にオプションを指定する
set :bundle_env_variables, { nokogiri_use_system_libraries: 1 }

namespace :deploy do
  desc 'restart application'
  task :restart do
    invoke 'unicorn:restart'
  end
end
after 'deploy:publishing', 'deploy:restart'
