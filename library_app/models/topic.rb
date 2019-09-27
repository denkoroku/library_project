require_relative('../db/sql_runner')

class Topic

  attr_reader :id, :book_id

  def initialize(options)
    @id = options['id'].to_i
    @book_id = options['book_id'].to_i
  end

#create
  def save
    sql = "INSERT INTO topics(book_id)VALUES($1)RETURNING id"
    values = [@book_id]
    topic = SqlRunner.run(sql, values).first
    @id = topic['id'].to_i
  end

#Read
  def self.all()
    sql = "SELECT * FROM topics"
    topic_data = SqlRunner.run(sql)
    return Topic.map_items(topic_data)
  end

#Delete
  def self.delete_all()
    sql = "DELETE FROM topics"
    SqlRunner.run(sql)
  end


#Returning books
  def books
    sql = "SELECT * FROM books WHERE book.id = $1"
    values = [@book_id]
    book_data = SqlRunner.run(sql, values)
    books = Book.map_items(book_data)
    return books
  end


  #Helper method for mapping
  def self.map_items(topic_data)
    result = topic_data.map { |topic| Topic.new( topic ) }
    return result
  end

end
