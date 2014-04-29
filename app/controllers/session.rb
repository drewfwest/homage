get '/' do
  erb :index
end

#----------- SESSIONS -----------

get '/sessions/new' do
  erb :sign_in
end

post '/sessions' do
  @user = User.find_by_email(params[:email])
  p @user.password
  p @user.password_hash
  if @user && @user.password == params[:password]
    session[:user_id] = @user.id
    redirect '/notes'
  else
    if !@user
      flash[:notice] = ["Email is incorrect"]
    else
      flash[:notice] = ["Password is incorrect"]
    end
      erb :sign_in
  end
end

delete '/sessions/:id' do
  session.clear
  redirect '/'
end

#----------- USERS -----------

get '/users/new' do
  erb :sign_up
end

post '/users' do
  @user = User.new(name: params[:name], email: params[:email])
  @user.password = params[:password_hash]
  @user.save!

  flash[:notice] = error_messages(@user)
  #BUGBUG Active Record validation errors not displaying to page

  if @user.valid?
    session[:user_id] = @user.id
    redirect '/notes'
  else
      erb :sign_up
  end
end
