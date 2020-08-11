class ApplicationController < Sinatra::Base
  set :views, proc { File.join(root, '../views/') }
  register Sinatra::Twitter::Bootstrap::Assets
  register Sinatra::ActiveRecordExtension

  set :database, {:adapter => "sqlite3", :database => "db/development.sqlite3"}

  get '/' do
    erb :"application/index"
  end
end
