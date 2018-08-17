# Rails Engine

#### About  
Rails Engine is an API that serves JSON responses based on sales data pulled from Etsy.  This project was evaluated at the Turing School of Software & Design in the Back-End Module 3 class, based on this [spec](http://backend.turing.io/module3/projects/rails_engine).

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
* Installs all the required gems:  
`bundle install` 
* Creates the database and migrates the tables:  
`rake db:{drop,create,migrate}`  
* Imports the data from the CSV files into your local database:  
`rake import:all`

#### Testing
To run the local test suite, use the command `rspec`.  
To run the spec harness, navigate your terminal to the spec harness folder and use the command `bundle exec rake`.

#### Example URLs
To run a local honest, run the command `rails s`.  
Within your browser, you can now navigate to the following URLs to see the JSON responses.  

* Returns a collection of items associated with that merchant:  
`/api/v1/merchants/:id/items`  
* Returns a collection of invoices associated with that merchant from their known orders:  
`/api/v1/merchants/:id/invoices`  
* Returns a collection of associated transactions:  
`/api/v1/invoices/:id/transactions`  
* returns a collection of associated invoice items:  
`/api/v1/invoices/:id/invoice_items`  
* Returns a collection of associated items:  
`/api/v1/invoices/:id/items`  
* Returns the top x merchants ranked by total revenue:  
`/api/v1/merchants/most_revenue?quantity=x`  
* Returns the customer who has conducted the most total number of successful transactions:  
`/api/v1/merchants/:id/favorite_customer`
* Returns a collection of customers which have pending (unpaid) invoices:  
`/api/v1/merchants/:id/customers_with_pending_invoices`  
