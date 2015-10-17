# server-based syntax
# ======================
server '52.3.163.31', user: 'ec2-user', roles: %w{web app db}

# role-based syntax
# ==================
role :app, %w{ec2-user@52.3.163.31}
role :web, %w{ec2-user@52.3.163.31}
role :db, %w{ec2-user@52.3.163.31}

# Configuration
# =============
set :stage, :production
set :unicorn_rack_env, "production"
set :branch, 'feature/cap_settings' 
set :rails_env, 'production'
set :migration_role, 'db'

# Custom SSH Options
# ==================
set :ssh_options, {
  keys: [File.expand_path('~/.ssh/totz-aws-key.pem')],
  forward_agent: true,
  auth_methods: %w(publickey)
}
