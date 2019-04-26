class ApplicationController < Sinatra::Base
  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  # code actions here!
  
  get '/' do
    redirect to '/recipes'
  end
  
  get '/recipes/new' do
    erb :new
  end
  
  post '/recipes' do 
    @recipe = Recipe.create(params)
    redirect to "/recipes/#{@recipe.id}"
  end
  
  get '/recipes' do 
    @recipes = Recipe.all
    erb :index
  end
  
  get '/recipes/:id' do  #loads show page
    @recipe = Recipe.find_by_id(params[:id])
    erb :show
  end

end
