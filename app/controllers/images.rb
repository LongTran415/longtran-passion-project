get '/images' do
  @images = Image.all.limit(20)
  erb :"images/show"
end

get '/images/search' do
  @images = Image.all
  erb :"images/_search", locals: {images: @images}
end

post '/images/search' do
  @images = Image.all
  erb :"images/_search", locals: {images: @images}
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

post '/images/:id/tags' do
  @image = Image.find(params[:id])

  tag_array = params[:tag][:name].scan(/\S*#(?:\[[^\]]+\]|\S+)/)

  tag_array.map! do |name|
    @tag = Tag.find_by(name: name)
    if @tag.nil?
      new_tag = Tag.create(name: name)
      @image.tags.push(new_tag)
    else
      @image.tags.push(@tag) unless @image.tags.include?(@tag)
    end
  end
  erb :"images/show"
end
