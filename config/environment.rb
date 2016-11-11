# Set up gems listed in the Gemfile.
# See: http://gembundler.com/bundler_setup.html
#      http://stackoverflow.com/questions/7243486/why-do-you-need-require-bundler-setup
ENV['BUNDLE_GEMFILE'] ||= File.expand_path('../../Gemfile', __FILE__)

require 'bundler/setup' if File.exists?(ENV['BUNDLE_GEMFILE'])

# Require gems we care about
require 'rubygems'
require 'hirb'
require 'uri'
require 'pathname'

require 'pg'
require 'active_record'
require 'logger'

require 'bcrypt'

require 'sinatra'
require "sinatra/reloader" if development?

require 'erb'
require 'faker'
require 'dotenv'
Dotenv.load
require 'paperclip'
require 'sass'

# Some helper constants for path-centric logic
APP_ROOT = Pathname.new(File.expand_path('../../', __FILE__))

APP_NAME = APP_ROOT.basename.to_s

configure do
  # By default, Sinatra assumes that the root is the file that calls the configure block.
  # Since this is not the case for us, we set it manually.
  set :root, APP_ROOT.to_path
  # See: http://www.sinatrarb.com/faq.html#sessions
  enable :sessions
  set :session_secret, ENV['SESSION_SECRET'] || 'this is a secret shhhhh'

  # Set the views to
  set :views, File.join(Sinatra::Application.root, "app", "views")

  # Configure SCSS
  set :scss, {:style => :compressed, :debug_info => false}
end

# Set up the controllers and helpers
Dir[APP_ROOT.join('app', 'controllers', '*.rb')].each { |file| require file }
Dir[APP_ROOT.join('app', 'helpers', '*.rb')].each { |file| require file }

# Set up the scss route
get '/css/:name.css' do |name|
  content_type :css
  scss "sass/#{name}".to_sym, layout: false
end

# Set up the database and models
require APP_ROOT.join('config', 'database')


#
# https://github.com/thoughtbot/paperclip/issues/1378
#
module Paperclip
  class SinatraFileAdapter < AbstractAdapter

    def initialize(target)
      @target = target[:tempfile]
      cache_current_values(target)
    end

    private

    def cache_current_values(target)
      self.original_filename = target[:filename]
      self.original_filename ||= File.basename(@target.path)
      @tempfile = copy_to_tempfile(@target)
      @content_type = Paperclip::ContentTypeDetector.new(@target.path).detect
      @size = File.size(@target)
    end

  end
end

Paperclip.io_adapters.register Paperclip::SinatraFileAdapter do |target|
  begin
   target.is_a?(Hash) && Tempfile === target[:tempfile]
  rescue => e
    false
  end
end

if $0 =='irb'
  require 'hirb'
  Hirb.enable
end
