# config valid for current version and patch releases of Capistrano
lock '~> 3.11.0'

set :application, 'hireflow'

set :repo_url, 'git@gitlab.doc.ic.ac.uk:g1727103/hireflow.git'

set :rbenv_type, :user
set :rbenv_ruby, File.read('.ruby-version').strip

set :format_options, color: true
set :pty, true

if ENV.key?('CI')
  set :repo_url, ENV['CI_REPOSITORY_URL']
  set :branch, ENV['CI_COMMIT_SHA']
else
  set :ssh_options, forward_agent: true
end

set :linked_files, %w[config/master.key]
set :linked_dirs, fetch(:linked_dirs, [])
  .push('log', 'tmp/pids', 'tmp/cache', 'tmp/sockets',
        'vendor/bundle', 'public/system', 'public/uploads', 'storage')

set :deploy_to, "/var/www/#{fetch(:application)}"
