post '/comments' do
  params[:comment][:user_id] = session[:id]
  @comment = Comment.create(params[:comment])
  content_type :json
  @comment.to_json(methods: %w(author))
end
