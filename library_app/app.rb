require( 'sinatra' )
require( 'sinatra/reloader' )
require_relative('controllers/admin_books_controller')
require_relative('controllers/admin_loans_controller')
require_relative('controllers/admin_users_controller')


get '/admin' do
  erb( :"admin/index" )
end
