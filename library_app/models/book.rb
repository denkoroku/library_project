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

  def delete()
    sql = "DELETE FROM books
    WHERE id = $1"
    values = [@id]
    SqlRunner.run(sql, values)
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
    borrowers = Borrower.map_items(borrower_data)
    return borrowers
  end

  def self.find(id)
      sql = "SELECT * FROM books
      WHERE id = $1"
      values = [id]
      result = SqlRunner.run(sql, values).first
      book = Book.new(result)
      return book
    end

  def number_of_loans()
    return borrowers.count
  end

  def getloan
    sql = "SELECT loans.* FROM loans WHERE loans.book_id = $1"
    value = [@id]
    borrower_data = SqlRunner.run(sql, value)
    books = Loan.map_items(borrower_data)
    return books
  end

  def onloan
    loan = self.getloan
    if loan.count >=1
       return "yes"
    else
       return "no"
    end
  end

  #Helper method for mapping
  def self.map_items(book_data)
    result = book_data.map { |book| Book.new( book ) }
    return result
  end


end
