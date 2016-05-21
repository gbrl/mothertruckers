# HOME
helpers do
  def current_user
    if session[:id] and user = User.find(session[:id])
      user
    end
  end
end


get '/profile' do
  @user = current_user if current_user
  @notes = current_user.notes if current_user
  @favourites = current_user.favourites if current_user
  erb :'users/show'
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
  @note = Note.new
  @rating = Rating.new
  @truck = Truck.find_by_slug(params[:slug])
  erb :'/trucks/show'
end

post '/trucks/:id/favourite' do
end

# USERS
get '/login' do
  erb :'users/index'
end

get '/logout' do
  session.clear
  redirect '/'
end

post '/users/login' do
  @user = User.find_by_email(params[:email])
  if @user && (@user.password == params[:password])
    session[:id] = @user.id
    redirect '/'
  else
    @email = params[:email]
    @error = "Oops! There was something wrong with your email or password."
    erb :'users/index'
  end
end

post '/users/register' do
  @user = User.find_by_email(params[:email])
  if @user
    @email = params[:email]
    @error = "Oops! There was something wrong with your email or password."
    erb :'users/index'
  else
    @user = User.create(email: params[:email], password: params[:password])
    if (@user.save)
      redirect '/'
    else
      @email = params[:email]
      @error = "Oops! There was something wrong with your email or password."
      erb :'users/index'
    end
  end
end

get '/users/:id' do
end


# FAVOURITES

post '/users/:user_id/favourites/:truck_id' do
  fave = Favourite.where(truck_id: params["truck_id"].to_i, user_id: params["user_id"].to_i)
  if fave
    Favourite.destroy(fave[0].id)
  else
    Favourite.create(truck_id: params["truck_id"].to_i, user_id: params["user_id"].to_i) 
  end
end

# NOTES

post '/notes' do
  Note.create(content: params[:content], truck_id: params[:truck_id], user_id: params[:user_id])
  redirect back
end

# RATINGS

post '/ratings' do
  Rating.create(score: params["score"].to_i, truck_id: params["truck_id"].to_i, user_id: params["user_id"].to_i)
  redirect back
end


# SEARCH RESULTS

get '/search' do
end
