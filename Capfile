require 'capistrano/setup'
require 'capistrano/deploy'

require 'capistrano/scm/git'
install_plugin Capistrano::SCM::Git

require 'capistrano/rbenv'
require 'capistrano/rails'

require 'capistrano/puma'
install_plugin Capistrano::Puma
install_plugin Capistrano::Puma::Nginx

# Load custom tasks from `lib/capistrano/tasks` if you have any defined
Dir.glob('lib/capistrano/tasks/*.rake').each { |r| import r }
