require_relative('../db/sql_runner')

class Topic

  attr_accessor :id, :topic

  def initialize(options)
    @id = options['id'].to_i
    @topic = options['topic']
  end

#create
  def save
    sql = "INSERT INTO topics(topic)VALUES($1)RETURNING id"
    values = [@topic]
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

  def self.topic_find(id)
    sql = "SELECT books.* FROM books
    INNER JOIN book_topic_join
    ON books.id=book_topic_join.book_id
    WHERE book_topic_join.topic_id = $1"
    values = [id]
    book_data = SqlRunner.run(sql, values)
    books = Book.map_items(book_data)
    return books
  end

  def self.find(id)
    sql = "SELECT * FROM topics
    WHERE id=$1"
    value = [id]
    result = SqlRunner.run(sql, value)
    return Topic.new(result.first)
  end

  #Helper method for mapping
  def self.map_items(topic_data)
    result = topic_data.map { |topic| Topic.new( topic ) }
    return result
  end

end
