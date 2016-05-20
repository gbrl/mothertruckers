# HOME
helpers do 
  def current_user
    if session[:id] and user = User.find(session[:id])
      user
    end
  end
end

get '/' do
  @stops = Stop.all
  erb :index
end

# TRUCKS
get '/trucks' do
  @trucks = Truck.all
  erb :'/trucks/index'
end

get '/trucks/:slug' do
  @truck = Truck.find_by_slug(params[:slug])
  erb :'/trucks/show'
end

post '/trucks/:id/favourite' do
end

# USERS
get '/users' do
  @users = User.all
  erb :'users/index'
end


get '/users/logout' do
  session.clear
  redirect '/'
end

post '/users/login' do
  @user = User.find_by_email(params[:email])
  if @user && (@user.password == params[:password])
    session[:id] = @user.id
    redirect '/'
  else
    @error = "Wrong email or password"
    erb :index
  end
end

post 'users/register' do
  @user = User.find_by_email(params[:email])
  if @user
    @error = "Email already exists"
    erb :index
  else
    @user = User.create(email: params[:email], password: params[:password])
    redirect '/'
  end
end

get '/users/:id' do
end


# FAVOURITES 

get '/users/:id/favourites' do
end

get '/users/:id/favourites/:id/delete' do
end


# SEARCH RESULTS

get '/search' do
end



