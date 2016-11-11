get '/countries/asia' do
  @country = Country.find_by(name: "Asia")
  erb :'partials/_asia_search'
end
