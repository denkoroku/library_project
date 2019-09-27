require_relative('../db/sql_runner')

class Loan

  attr_reader :id, :borrower_id, :book_id

  def initialize(options)
    @id = options['id'].to_i
    @borrower_id = options['borrower_id'].to_i
    @book_id = options['book_id'].to_i
  end

#create
  def save
    sql = "INSERT INTO loans(borrower_id,book_id)VALUES($1, $2)RETURNING id"
    values = [@borrower_id, @book_id]
    loan = SqlRunner.run(sql, values).first
    @id = loan['id'].to_i
  end

#Read
  def self.all()
    sql = "SELECT * FROM loans"
    loan_data = SqlRunner.run(sql)
    return Loan.map_items(loan_data)
  end

#Delete
  def self.delete_all()
    sql = "DELETE FROM loans"
    SqlRunner.run(sql)
  end


#Returning things and people
  def book
    sql = "SELECT * FROM books WHERE books.id = $1"
    values = [@book_id]
    book_data = SqlRunner.run(sql, values)
    book = Book.map_items(book_data).first
    return book
  end

  def borrower
    sql = "SELECT * FROM borrowers WHERE borrower.id = $1"
    values = [@borrower_id]
    borrower_data = SqlRunner.run(sql, values)
    borrower = Borrower.map_items(borrower_data).first
    return borrower
  end


  #Helper method for mapping
  def self.map_items(loan_data)
    result = loan_data.map { |loan| Loan.new( loan ) }
    return result
  end

end
