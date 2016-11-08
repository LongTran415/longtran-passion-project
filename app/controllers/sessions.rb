get '/sessions/new' do
  erb :'sessions/new'
end

post '/sessions' do
  @user = User.find_by_email(params[:email])
  if @user && @user.password == params[:password]

    session[:id] = @user.id
    redirect "/users/#{@user.id}"
  else
    @errors = ["Invaild password or email..."]
    erb :'sessions/new'
  end
end

delete '/sessions' do
  session[:id] = nil
  redirect '/'
end
