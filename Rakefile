ENV["SINATRA_ENV"] ||= "development"

require_relative './config/environment'
require 'sinatra/activerecord/rake'

namespace :db do
    task :load_config do
        require './app/controllers/application_controller'
    end
end

# Type `rake -T` on your command line to see the available rake tasks.
