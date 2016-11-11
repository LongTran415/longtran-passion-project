get '/' do
  @images = Image.all
  erb :index
end
