require_relative '../helpers/helper'

post '/users/:id/follow' do
  current_user.followed_users << User.find(params[:id])
  redirect '/home'
end