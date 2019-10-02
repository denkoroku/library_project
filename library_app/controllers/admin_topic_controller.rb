require( 'sinatra' )
require( 'sinatra/reloader' )
require( 'pry')
require_relative('../models/book')
require_relative('../models/join')
require_relative('../models/topic')
require_relative('../models/loan')
require_relative('../models/borrower')
also_reload( '../models/*' )

get '/admin/list_topics' do
  @topic = Topic.all
  erb( :"admin/list_topics" )
end

get '/admin/new_topic' do
  @topics = Topic.all
  @books = Book.all
  erb(:'admin/new_topic')
end

get '/admin/list_topic/book_:id' do
  @topic = Topic.find(params['book_id'])
  erb(:'admin/show_topic')
end

get '/admin/list_topic/:id/edit' do
    @topic = Topic.find(params['id'])
    erb(:'admin/edit_topic')
end

put '/admin/list_topics/:id' do
  topic = Topic.new(params)
  topic.update
  redirect to "/admin/list_topics/#{params['id']}"
end


get '/admin/list_topics/:id/delete' do
  topic = Topic.find(params['id'])
  topic.delete
  redirect to '/admin/list_topics'
end
