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
borrower4 = Borrower.new({'first_name' => 'Johnothan', 'last_name' => 'Billard', 'email' => 'jbillard@google.com'})
borrower4.save()


book1 = Book.new({'title' => 'The Art of Spelling', 'author' => 'Jan Smith','published_date' => '2018','bought_date' => '2019', 'price' => '8.99' })
book1.save
book2 = Book.new({'title' => 'Teaching Naughty Kids', 'author' => 'Cath Riddoch','published_date' => '2013','bought_date' => '2018', 'price' => '108.99' })
book2.save
book3 = Book.new({'title' => 'Autistic Girls', 'author' => 'Helen Copus','published_date' => '2013','bought_date' => '2017', 'price' => '28.99' })
book3.save
book4 = Book.new({'title' => 'Slow Learning', 'author' => 'Jane Dillon','published_date' => '2014','bought_date' => '2019', 'price' => '35.00' })
book4.save


loan1 = Loan.new({'borrower_id' => borrower1.id, 'book_id' => book1.id, 'loan_date' => '2019-08-13 00:00:00' })
loan1.save
loan2 = Loan.new({'borrower_id' => borrower2.id, 'book_id' => book3.id, 'loan_date' => '2019-09-13 00:00:00' })
loan2.save
loan3 = Loan.new({'borrower_id' => borrower3.id, 'book_id' => book2.id, 'loan_date' => '2019-02-13 00:00:00' })
loan3.save

topic1 = Topic.new({'topic' => 'dyslexia'})
topic1.save
topic2 = Topic.new({'topic' => 'dyspraxia'})
topic2.save
topic3 = Topic.new({'topic' => 'ADHD'})
topic3.save
topic3 = Topic.new({'topic' => 'sensory integration'})
topic3.save
topic4 = Topic.new({'topic' => 'autism'})
topic4.save


join1 = Join.new({'topic_id' => topic1.id, 'book_id' => book1.id})
join1.save
join2 = Join.new({'topic_id' => topic4.id, 'book_id' => book3.id})
join2.save
join3 = Join.new({'topic_id' => topic1.id, 'book_id' => book2.id})
join3.save



binding.pry
nil
