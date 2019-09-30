require( 'sinatra' )
require( 'sinatra/reloader' )
require_relative('../models/book')
require_relative('../models/join')
require_relative('../models/topic')
require_relative('../models/borrower')
also_reload( '../models/*' )

get '/admin/list_borrowers' do
  @borrower = Borrower.all
  erb( :"admin/list_borrowers" )
end

get '/admin/new_user' do
  erb(:'admin/new_user')
end

get '/admin/list_borrowers/:id' do
  @borrower = Borrower.find(params['id'])
  erb(:'admin/show_borrower')
end

get '/admin/list_borrowers/:id/edit' do
    @borrower = Borrower.find(params['id'])
    erb(:'admin/edit_user')
end

post '/admin/list_borrowers/:id' do
  borrower = Borrower.new(params)
  borrower.update
  redirect to "/admin/list_borrowers/#{params['id']}"
end

post '/admin/list_borrowers/:id/delete' do
  borrower = Borrower.find(params['id'])
  borrower.delete
  redirect to '/admin/list_borrowers'
end

post '/admin/new_user' do
  Borrower.new(params).save
  erb(:'admin/new_user')
end

post '/admin/edit_user' do
  Borrower.new(params).update
  erb(:'admin/edit_user')
end
