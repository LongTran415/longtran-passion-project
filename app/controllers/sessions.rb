get '/sessions/new' do
  erb :'sessions/new'
end

post '/sessions' do
  @user = User.find_by_email(params[:email])
  if @user && @user.password == params[:password]

    login(@user)
    redirect "/users/#{@user.id}"
  else
    @errors = ["Username or Password not found."]
    erb :'sessions/new'
  end
end

delete '/sessions' do
  logout
  redirect '/'
end
