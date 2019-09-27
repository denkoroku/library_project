require_relative('../db/sql_runner')

class Book

  attr_reader :id
  attr_accessor :title, :author, :published_date, :bought_date, :price


  def initialize(options)
    @id = options['id'].to_i
    @title = options['title']
    @author = options['author']
    @published_date = options['published_date']
    @bought_date = options['bought_date']
    @price = options['price'].to_f
  end


# Create
  def save()
    sql = "INSERT INTO books(title, author, published_date, bought_date, price)VALUES($1, $2, $3, $4, $5)RETURNING *"
    values = [@title, @author, @published_date, @bought_date, @price]
    book = SqlRunner.run(sql, values).first
    @id = book['id'].to_i
  end

#Read
  def self.all()
    sql = "SELECT * FROM books"
    book_data = SqlRunner.run(sql)
    return Book.map_items(book_data)
  end

#Update
  def update
    sql = "UPDATE books SET title = $1, author = $2, published_date = $3, bought_date = $4 price = $2 WHERE id = $5"
    values = [@title, @author, @published_date, @bought_date, @price, @id]
    SqlRunner.run(sql, values)
  end

#Delete
  def self.delete_all()
    sql = "DELETE FROM books"
    SqlRunner.run(sql)
  end

# other methods
  def borrowers()
    sql = "SELECT borrowers.*
    FROM borrowers
    INNER JOIN loans
    ON loans.borrower_id = borrowers.id
    WHERE loans.book_id = $1"
    values = [@id]
    borrower_data = SqlRunner.run(sql, values)
    borrower = Borrower.map_items(borrower_data)
    return borrowers
  end

  def number_of_loans()
    return borrowers.count
  end

  #Helper method for mapping
  def self.map_items(book_data)
    result = book_data.map { |book| Book.new( book ) }
    return result
  end


end
