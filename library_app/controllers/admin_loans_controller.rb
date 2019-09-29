require( 'sinatra' )
require( 'sinatra/reloader' )
require_relative('../models/book')
require_relative('../models/join')
require_relative('../models/topic')
also_reload( '../models/*' )

get '/admin/list_loans' do
  @loan_borrower = Loan.borrower
  erb( :"admin/list_loans" )
end
