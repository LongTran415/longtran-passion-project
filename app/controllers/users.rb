get '/' do
  erb :index
end

# new user
get '/users/new' do
  erb :'users/new'
end

# create user
post '/users' do

  if params[:password_confirmation] == params[:user][:password]
    @user = User.new(params[:user])

    if @user.save
      session[:id] = @user.id
      redirect "/users/#{@user.id}"
    else
      @errors = @user.errors.full_messages
      erb :'users/new'
    end

  else
    @errors = ["Passwords do not match!"]
    erb :'users/new'
  end

end

# user show page
get '/users/:id' do
  @user = User.find(params[:id])
  erb :'users/show'
end

# # user update
# get '/users/:id/edit' do
#   @user = User.find(params[:id])
#   erb :'users/edit'
# end
#
#
# # user update
# put '/users/:id' do
#   @user = User.find(params[:id])
#   @user.update(params[:user])
#   redirect "/users/#{@user.id}"
# end
#
#
# # user delete
# delete '/users/:id' do
#   @user = User.find(params[:id])
#   @user.destroy
#   redirect "/users"
# end


# GET users portfolios
get '/users/:id/portfolios' do
  @user = User.find(params[:id])
  erb :"users/portfolios/index"
end
