require( 'sinatra' )
require( 'sinatra/reloader' )



get '/admin' do
  erb( :"admin/index" )
end
