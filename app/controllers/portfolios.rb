get '/portfolios/new' do
  @images = Image.all.limit(3)

  @portfolio = Portfolio.new(user_id: current_user.id)
  erb :'/portfolios/new'
end

get '/portfolios/:id' do
  @portfolio = Portfolio.find(params[:id])
  if @portfolio.nil?
    @error = "You don't have any portfolios"
    erb :'portfolios/index'
  else
    erb :'portfolios/show'
  end
end

get '/portfolios/:id/edit' do
  @portfolio = Portfolio.find(params[:id])
  erb :'portfolios/edit'
end

post '/portfolios' do
  @portfolio = Portfolio.create(title: params[:title], user_id: session[:id])
  redirect "/portfolios/#{@portfolio.id}"
end

delete '/portfolios/:id' do
  @portfolio = Portfolio.find(params[:id])
  @portfolio.destroy

  redirect "/portfolios/new"
end
