get '/' do
  @users = User.all
  @user = User.find(params[:id])
  erb :index
end

post '/users' do
  user = User.create(params)
  session[:user_id]=user.id
  redirect "/users/#{user.id}"
end

get '/users/:id' do
  @user = User.find(params[:id])
  erb :profile
end

post '/login' do
  @user= User.find_by_username (params[:username])
  p @user
  if @user
    session[:user_id] = @user.id
    redirect "/"
  else
    @errors = "Hey, you don't exist :( Sign up to chirp!"
    erb :index
  end
end

get '/logout' do
  session.clear
  redirect '/'
end

post '/chirps' do
  Chirp.create(params)
  p params
  redirect "/users/#{params[:user_id]}"
end