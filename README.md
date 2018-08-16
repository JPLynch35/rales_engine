# Rails Engine

#### About  
Rails Engine is an API that serves JSON responses based on sales data pulled from Etsy.

Data:
* Customers
* Merchants
* Invoices
* Transactions
* Items
* Invoice Items

Technology:
* Ruby 2.4.1
* Rails 5.1.6

#### Set Up
Clone the repository onto your local machine.  
Open the project folder within your terminal and use the following commands:  
* `rake db:{create,migrate}` This creates the database and migrates the tables.
* `rake import:all` This imports the data from the csv files into your local database.

#### Testing
To run the local test suite, use the command `rspec`.  
To run the spec harness, naviaget your temrinal to the spec harness folder and use the command `bundle exec rake`.
