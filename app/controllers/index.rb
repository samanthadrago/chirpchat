require_relative '../helpers/helper'

get '/' do
  erb :index
end

get '/home' do
  @users = User.all
  erb :home
end

post '/users' do
  user = User.create(params)
  session[:user_id]=user.id
  redirect "/home"
end

get '/users/:id' do
  # @user = User.find(params[:id])
  erb :profile
end

post '/login' do
  # current_user
  # @user= User.find_by_username (params[:username])
  if current_user
    # session[:user_id] = @user.id
    redirect '/home'
  else
    @errors = "Hey, you don't exist :( Sign up to chirp!"
    redirect '/'
  end
end

get '/logout' do
  session.clear
  redirect '/'
end

post '/chirps' do
  Chirp.create(params)
  redirect "/users/#{@current_user.id}"
end