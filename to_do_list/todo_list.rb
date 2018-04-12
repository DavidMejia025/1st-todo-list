require "sinatra"
require "sinatra/activerecord"
require "./models/activity.rb"
require "./models/category.rb"
require "./models/calendar.rb"
require "./models/todo.rb"
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
  @todo = ToDo.create(name: params[:name])
  redirect "/todo"
end

get '/todo/:id/activities' do 
	@activities = ToDo.find(params[:id])
	erb :index
end


post '/activity' do 
  category = Category.find_by(name:params[:activity]["category"])
  @activity = category.activities.create(params[:activity]["task"])
  redirect '/activity'
end

get '/activity/edit/:id' do
  @activity = activity.update(params[:id])
  puts "activitys"
  redirect '/activity'
end

get '/activity/delete/:id' do
    @activity = activity.destroy(params[:id])
    redirect '/activity'
end