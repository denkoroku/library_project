require( 'sinatra' )
require( 'sinatra/reloader' )
require_relative('../models/book')
require_relative('../models/join')
require_relative('../models/topic')
also_reload( '../models/*' )

get '/admin/list_books' do
  @books = Book.all
  erb( :"admin/list_books" )
end

get '/admin/list_topics' do
  @topics = Topic.all
  erb( :"admin/list_topics" )
end
