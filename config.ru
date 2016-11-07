# Require config/environment.rb
require 'sass/plugin/rack'
require ::File.expand_path('../config/environment',  __FILE__)

set :app_file, __FILE__

use Sass::Plugin::Rack

run Sinatra::Application
