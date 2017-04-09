class Chitter < Sinatra::Base

  get '/sessions/new' do
    erb :'sessions/new'
  end

  get '/sessions/global_feed' do
    erb :'sessions/global_feed'
  end

  post '/sessions' do
  user = User.authenticate(params[:email], params[:password])
  if user
    session[:user_id] = user.id
    redirect '/users/mypeeps'
  else
    flash.now[:errors] = ['The email or password is incorrect']
    erb :'sessions/new'
  end
end

  post '/sessions/end' do
  flash.next[:goodbye_message] = "Goodbye"
  session[:user_id] = nil
  redirect '/sessions/new'
  end

end