require( 'pry' )
require_relative( 'models/borrower' )
require_relative( 'models/book' )
require_relative( 'models/loan' )
require_relative( 'models/topic' )
require_relative( 'models/join' )

# basic setup

Borrower.delete_all()
Book.delete_all()
Loan.delete_all()
Topic.delete_all()
Join.delete_all()

borrower1 = Borrower.new({'first_name' => 'Fred', 'last_name' => 'Jones', 'email' => 'fred@jones.com'})
borrower1.save()
borrower2 = Borrower.new({'first_name' => 'Jane', 'last_name' => 'Hendry', 'email' => 'jane@hotmail.com'})
borrower2.save()
borrower3 = Borrower.new({'first_name' => 'Jo', 'last_name' => 'Denerley', 'email' => 'jden@denerley.co.uk'})
borrower3.save()


book1 = Book.new({'title' => 'The Art of Spelling', 'author' => 'Jan Smith','published_date' => '2018','bought_date' => '2019', 'price' => '8.99' })
book1.save
book2 = Book.new({'title' => 'Teaching Naughty Kids', 'author' => 'Cath Riddoch','published_date' => '2013','bought_date' => '2018', 'price' => '108.99' })
book2.save
book3 = Book.new({'title' => 'Autistic Girls', 'author' => 'Helen Copus','published_date' => '2013','bought_date' => '2017', 'price' => '28.99' })
book3.save

loan1 = Loan.new({'borrower_id' => borrower1.id, 'book_id' => book1.id})
loan1.save

topic1 = Topic.new({'topic' => 'dyslexia'})
topic1.save
topic2 = Topic.new({'topic' => 'dyspraxia'})
topic2.save
topic3 = Topic.new({'topic' => 'ADHD'})
topic3.save

join1 = Join.new({'topic_id' => topic1.id, 'book_id' => book1.id})
join1.save


# borrower1.lend(book1)


binding.pry
nil
