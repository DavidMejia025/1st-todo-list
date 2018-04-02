require "sinatra"
require "sinatra/activerecord"
require "./models/activity.rb"
require "./models/category.rb"
require "./models/calendar.rb"
require "pry"

set :database, "sqlite3:myblogdb.sqlite3"

get '/' do
	redirect '/activities'
end

get '/activities' do 
	@activities = Activity.all
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