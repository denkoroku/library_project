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

get '/admin/new_loan' do
  @books = Book.all
  @borrowers = Borrower.all
  erb(:'admin/new_loan')
end

get '/admin/list_loan/:id' do
  @loan = Loan.find(params['id'])
  erb(:'admin/show_loan')
end

get '/admin/list_loan/:id/edit' do
    @loan = Loan.find(params['id'])
    erb(:'admin/edit_loan')
end

put '/admin/list_loans/:id' do
  loan = Loan.new(params)
  loan.update
  redirect to "/admin/list_loans/#{params['id']}"
end


get '/admin/list_loans/:id/delete' do
  loan = Loan.find(params['id'])
  loan.delete
  redirect to '/admin/list_loans'
end

post '/admin/loans' do
  params['loan_date'] = DateTime.now
  Loan.new(params).save
  # erb(:'admin/new_loan')
  redirect to '/admin/list_loans'
end
