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
  @user = User.find(params[:id])
  erb :profile
end

post '/login' do
  user = User.find_by_username (params[:username])
  if user.password == params[:password]
    session[:user_id] = user.id
    current_user
    redirect '/home'
  else
    flash[:login] = "We couldn't find username or password."
    redirect '/'
  end
end

get '/logout' do
  redirect '/'
  session.clear
end

post '/chirps' do
  Chirp.create(params)
  redirect "/users/#{current_user.id}"
end