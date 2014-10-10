helpers do
  def current_user
   @current_user ||= User.find(session[:user_id])
 end
end


# -filters for controller for any particular routes that need to be authenticated
#   -confirm that there is a user and that they are authenticated to see the content before they see it
#   -if someones not authorized redirect home
# -session clear when logout