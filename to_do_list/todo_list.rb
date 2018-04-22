require "sinatra"
require "sinatra/activerecord"
require "./models/activity.rb"
require "./models/category.rb"
require "./models/calendar.rb"
require "./models/todo.rb"
require "./models/done.rb"
require "pry"

set :database, "sqlite3:myblogdb.sqlite3"

get '/' do
	redirect '/todo'
end

get '/todo' do
  @todos = ToDo.all
  erb :index
end

post '/todo' do
  @todo = ToDo.create(name: params[:todo]["name"])
  redirect "/todo"
end

get '/todo/:id' do 
	@todo = ToDo.find(params[:id]) 
  @activities = @todo.activities
	erb :show
end


post '/todo/activity/:id' do 
  todo = ToDo.find(params[:id])
  category = Category.find_by(name:params[:activity]["category"])
  @activity = todo.activities.create({name:params[:activity]["task"],category_id:category.id,count:1})
  binding.pry
  redirect "/todo/#{todo.id}"
end

get '/todo/activity/edit/:id' do
  @activity = Activity.find(params[:id])
  @activity.dones.create()
  @dones = Done.all
  @activity.update(count:@activity.done(@activity.count))
  erb :edit
end

get '/todo/activity/delete/:id' do
    @activity = Activity.find(params[:id])
    todo= @activity.to_do
    @activity.destroy
    redirect "/todo/#{todo.id}"
end