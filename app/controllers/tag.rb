get '/tags/:id/images' do
  @tag = Tag.find(params[:id])
  erb :'images/tags/show'
end
