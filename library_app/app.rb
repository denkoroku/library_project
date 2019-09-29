require( 'sinatra' )
require( 'sinatra/reloader' )
require_relative('models/borrower')
require_relative('models/book')
require_relative('models/join')
require_relative('models/loan')
require_relative('models/topic')



get '/admin' do
  erb( :"admin/index" )
end

get '/admin/list_borrowers' do
  @borrower = Borrower.all
  erb( :"admin/list_borrowers" )
end

get '/admin/list_books' do
  @books = Book.all
  erb( :"admin/list_books" )
end

get '/admin/list_topics' do
  @topics = Topic.all
  erb( :"admin/list_topics" )
end

get '/admin/list_loans' do
  @loan_borrower = Loan.borrower
  erb( :"admin/list_loans" )
end

get '/admin/new_user' do
  erb(:'admin/new_user')
end
