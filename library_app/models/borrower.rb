require_relative('../db/sql_runner')

class Borrower

  attr_reader :id, :first_name, :last_name, :email

  def initialize(options)
    @id = options['id'].to_i
    @first_name = options['first_name']
    @last_name = options['last_name']
    @email = options['email']
  end

# setup CRUD
# Create
  def save()
    sql = "INSERT INTO borrowers(first_name, last_name, email) VALUES($1, $2, $3) RETURNING id"
    values = [@first_name, @last_name, @email]
    customer = SqlRunner.run(sql, values).first
    @id = borrower['id'].to_i
  end

# Read
  def self.all()
    sql = "SELECT * FROM borrowers"
    borrower_data = SqlRunner.run(sql)
    return Borrower.map_items(borrower_data)
  end

# update
  def update
    sql = "UPDATE borrowers SET
     first_name = $1, last_name = $2, email = $3, WHERE id = $4"
    values = [@first_name, @last_name, @email, @id]
    SqlRunner.run(sql, values)
  end

# Delete
def self.delete_all()
  sql = "DELETE FROM borrowers"
  SqlRunner.run(sql)
end

# other methods
  def books()
    sql = "SELECT book.* FROM books
    INNER JOIN loans ON loans.book_id = book.id
    WHERE loan.borrower_id = $1"
    values = [@id]
    book_data = SqlRunner.run(sql, values)
    return Thing.map_items(book_data)
  end

  def books_borrowed()
    return books()
  end


  #Helper method for mapping
  def self.map_items(borrower_data)
    result = borrower_data.map { |borrower| Borrower.new( borrower ) }
    return result
  end

end
