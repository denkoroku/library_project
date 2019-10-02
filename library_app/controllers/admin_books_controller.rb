require( 'sinatra' )
require( 'sinatra/reloader' )
require_relative('../models/book')
require_relative('../models/join')
require_relative('../models/topic')
require_relative('../models/borrower')
also_reload( '../models/*' )

get '/admin/list_books' do
  @books = Book.all
  @topics = Topic.all
  erb( :"admin/list_books" )
end

post '/admin/list_books' do
  @books = Book.all
  @topic = Topic.topic_find(params['topic_id'])
  @filter_name = Topic.find(params['topic_id'].to_i)
  erb( :"admin/filter_topic" )
end


get '/admin/list_topics' do
  @topics = Topic.all
  erb( :"admin/list_topics" )
end

get '/admin/new_book' do
  @topics = Topic.all
  erb(:'admin/new_book')
end

get '/admin/list_books/:id' do
  @book = Book.find(params['id'])
  erb(:'admin/show_book')
end

get '/admin/list_books/:id/edit' do
    @book = Book.find(params['id'])
    erb(:'admin/edit_book')
end

put '/admin/list_books/:id' do
  book = Book.new(params)
  book.update
  redirect to "/admin/list_books/#{params['id']}"
end

post '/admin/list_books/:id/delete' do
  book = Book.find(params['id'])
  book.delete
  redirect to '/admin/list_books'
end

post '/admin/new_book' do
  @topics = Topic.all
  @book_id = Book.new(params).save
  Join.new({'topic_id' => params["topic_id"].to_i, 'book_id' => @book_id}).save
  redirect to '/admin/list_books'
end
