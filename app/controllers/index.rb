get '/' do
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
    redirect "/users/#{@user.id}"
  else
    @errors = "Hey, you don't exist :( Sign up to chirp!"
    erb :index
  end
end

get '/logout' do
  session[:user_id]=nil
  redirect '/'
end