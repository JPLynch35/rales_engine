# Rails Engine

#### About  
Rails Engine is an API that serves JSON responses based on sales data pulled from Etsy.  This project was evaluated at the Turing School of Software & Design in the Back-End Module 3 class, based on the following spec, [here](http://backend.turing.io/module3/projects/rails_engine)

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
Open the project folder within your terminal (`cd rales_engine`)and use the following commands:  
* `bundle install` This installs all the required gems.
* `rake db:{drop,create,migrate}` This creates the database and migrates the tables.
* `rake import:all` This imports the data from the csv files into your local database.

#### Testing
To run the local test suite, use the command `rspec`.  
To run the spec harness, navigate your terminal to the spec harness folder and use the command `bundle exec rake`.

#### Example URLs
To run a local honest, run the command `rails s`.
Within your browser, you can now navigate to the following URLs to see the JSON responses.
Merchants
GET /api/v1/merchants/:id/items returns a collection of items associated with that merchant
GET /api/v1/merchants/:id/invoices returns a collection of invoices associated with that merchant from their known orders
Invoices
GET /api/v1/invoices/:id/transactions returns a collection of associated transactions
GET /api/v1/invoices/:id/invoice_items returns a collection of associated invoice items
GET /api/v1/invoices/:id/items returns a collection of associated items
GET /api/v1/merchants/most_revenue?quantity=x returns the top x merchants ranked by total revenue
GET /api/v1/merchants/:id/favorite_customer returns the customer who has conducted the most total number of successful transactions.
GET /api/v1/merchants/:id/customers_with_pending_invoices returns a collection of customers which have pending (unpaid) invoices.
