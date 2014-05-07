get '/' do
  session.delete(:request_token)
  erb :index
end

#----------- SESSIONS -----------

get '/sessions/new' do
  erb :sign_in
end

post '/sessions' do
  flash[:user_input] = get_messages(params)
  @user = User.find_by_email(params[:email])
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

#----------- SESSIONS/TWITTER -----------

get '/sessions/twitter/new' do
# the 'request_token' method is defined in 'app/helpers/oauth.rb'
  redirect request_token.authorize_url
end

get '/auth' do
  # the 'request_token' method is defined in 'app/helpers/oauth.rb'
  @access_token = request_token.get_access_token(:oauth_verifier => params[:oauth_verifier])
  # our request token is only valid until we use it to get an access token, so let's delete it from our session
  p @access_token
  p '*'*50
  p params
  session.delete(:request_token)
  @user = User.find_or_create_by(oauth_token: params["oauth_token"], oauth_verifier: params["oauth_verifier"])
  p @user

  if @user
    session[:user_id] = @user.id
    p session
    redirect '/notes'
  else
    p '*'*50
    p 'LOGIN FAILED'
    p '*'*50
    # display a message to the user describing the error
    redirect '/sessions/new'
  end
  # create a user account
  # store the access token. You can use this token to later
  # initialize a TwitterAPI::Client object and make calls to the Twitter API.
  # @user = User.create(username: @access_token.params[:screen_name], oauth_token: params[:oauth_token], oauth_secret: params[:oauth_verifier])
  # erb :index
end

#----------- USERS -----------

get '/users/new' do
  erb :sign_up
end

post '/users' do
  flash[:user_input] = get_messages(params)
  @user = User.new(name: params[:name], email: params[:email])
  @user.password = params[:password_hash]
  @user.save!

  flash[:notice] = error_messages(@user)
  #BUGBUG Active Record validation errors not displaying to page

  if @user.valid?
    session[:user_id] = @user.id
    redirect '/notes'
  else
    if @user.name = false
      flash[:notice] = flash[:notice][0]
    else
      erb :sign_up
    end
  end
end