require "sinatra"
require "sinatra/activerecord"
require "./models/activity.rb"
require "./models/category.rb"
require "./models/calendar.rb"
require "./models/todo.rb"
require "./models/done.rb"
require "pry"

get '/' do
  binding.pry
	redirect '/todo'
end

get '/todo' do
  @todos = ToDo.all
  erb :index
end

post '/todo' do
  @todo = ToDo.create(name: params[:todo]["name"])
  @done =  @todo.dones.create
  redirect "/todo"
end

get '/todo/:id' do 
	@todo = ToDo.find(params[:id]) 
  @activities = @todo.activities
	erb :show
end

get '/todo/:id/done' do
  @todo = ToDo.find(params[:id])
  @todo.dones.create
  redirect "/todo"
end

get '/todo/activity/:id/done' do
  @activity = Activity.find(params[:id])
  @activity.dones.create
  redirect "/todo/activity/edit/#{@activity.id}"
end

post '/todo/activity/:id' do 
  todo = ToDo.find(params[:id])
  category = Category.find_by(name:params[:activity]["category"])
  @activity = todo.activities.create({name:params[:activity]["task"],category_id:category.id,count:1})
  @activity.dones.create
  redirect "/todo/#{todo.id}"
end

get '/todo/activity/edit/:id' do
  @activity = Activity.find(params[:id])
  @activity.update(count:@activity.dones.count)
  @todo = @activity.to_do
  @dones_todo = @todo.dones
  @dones_todo = @dones_todo.order("created_at ASC") 
  @dones_activity = @activity.dones
  erb :edit
end

post '/todo/:id/category' do
  @todo = ToDo.find(params[:id])
  @category = @todo.categories.create(name: params[:category]["name"])
  redirect "/todo/#{@todo.id}"
end


get '/todo/activity/delete/:id' do
    @activity = Activity.find(params[:id])
    todo= @activity.to_do
    @activity.destroy
    redirect "/todo/#{todo.id}"
end