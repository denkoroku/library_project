require_relative('../db/sql_runner')

class Join

  attr_reader :id, :topic_id, :book_id

  def initialize(options)
    @id = options['id'].to_i
    @topic_id = options['topic_id'].to_i
    @book_id = options['book_id'].to_i
  end

#create
  def save
    sql = "INSERT INTO book_topic_join(topic_id, book_id)VALUES($1, $2)RETURNING id"
    values = [@topic_id, @book_id]
    join = SqlRunner.run(sql, values).first
    @id = join['id'].to_i
  end

#Read
  def self.all()
    sql = "SELECT * FROM book_topic_join"
    join_data = SqlRunner.run(sql)
    return Join.map_items(join_data)
  end

#Delete
  def self.delete_all()
    sql = "DELETE FROM book_topic_join"
    SqlRunner.run(sql)
  end

  #Helper method for mapping
  def self.map_items(join_data)
    result = join_data.map { |join| Join.new( join ) }
    return result
  end

end
