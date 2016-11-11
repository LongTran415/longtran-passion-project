get '/countries/asia' do
  @country = Country.find_by(name: params[:name])
  erb :'partials/_images_asia'
end
