require "sinatra"
require "sinatra/activerecord"
require "./models/todo.rb"
require "./models/category.rb"
require "./models/calendar.rb"


set :database, "sqlite3:myblogdb.sqlite3"

get '/' do
	redirect '/to_do'
end

get '/to_do' do 
	@todo = ToDo.all
	erb :index
end


post '/tareas' do 
  @tarea = Tarea.create(params[:tarea])
  puts @tarea
  redirect '/tareas'
end

get '/tareas/edit/:id' do
  @tarea = Tarea.update(params[:id])
  puts "tareass"
  redirect '/tareas'
end

get '/tareas/delete/:id' do
    @tarea = Tarea.destroy(params[:id])
    redirect '/tareas'
end