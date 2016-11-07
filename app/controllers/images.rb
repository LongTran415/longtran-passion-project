get '/images' do
  @images = Image.all.limit(20)
  erb :"images/index"
end

post '/images' do
  @image = Image.create(data: params[:data], portfolio_id: params[:portfolio_id])
  redirect "/portfolios/#{params[:portfolio_id]}/edit"
end

get '/images/:id' do
  @image = Image.find(params[:id])
  erb :"images/show"
end

delete '/images/:id' do
  @image = Image.find(params[:id])
  @image.destroy

  redirect "/portfolios/#{@image.portfolio.id}/edit"
end
