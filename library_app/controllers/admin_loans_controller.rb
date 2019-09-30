require( 'sinatra' )
require( 'sinatra/reloader' )
require( 'pry')
require_relative('../models/book')
require_relative('../models/join')
require_relative('../models/topic')
require_relative('../models/loan')
require_relative('../models/borrower')
also_reload( '../models/*' )

get '/admin/list_loans' do
  @loans = Loan.all
  erb( :"admin/list_loans" )
end
