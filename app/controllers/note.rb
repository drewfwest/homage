get '/notes' do
  if current_user
    @notes = Note.all.reverse
    @users = User.all
    erb :_display_all_notes
  else
    redirect '/'
  end
end

get '/notes/new' do
  if current_user
    erb :_add_note
  else
    redirect '/'
  end
end

post '/notes' do
  @note = Note.create(title: params[:title], content: params[:content], user_id: session[:user_id])
  redirect '/notes'
end

get '/notes/:id' do
  if current_user
    @note = Note.find(params[:id])
    erb :_display_a_note
  else
    redirect '/'
  end
end

delete '/notes/:id' do
  Note.destroy(params[:id])
  redirect '/notes'
end