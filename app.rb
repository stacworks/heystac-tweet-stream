require 'sinatra'

configure do
  set :server, :puma
end

get '/' do
  erb :index
end
