require( 'sinatra' )
require( 'sinatra/reloader' )
require_relative('../models/book')
require_relative('../models/join')
require_relative('../models/topic')
also_reload( '../models/*' )

get '/admin/list_borrowers' do
  @borrower = Borrower.all
  erb( :"admin/list_borrowers" )
end

get '/admin/new_user' do
  erb(:'admin/new_user')
end

post '/admin/new_user' do
  Borrower.new(params).save
  erb(:'admin/new_user')
end

get '/admin/edit_user' do
  erb(:'admin/edit_user')
end

post '/admin/edit_user' do
  Borrower.new(params).update
  erb(:'admin/edit_user')
end
