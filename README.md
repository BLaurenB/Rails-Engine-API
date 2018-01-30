# Rails Engine

Rails engine (Sales Engine via Rails) is a RESTful Business Intelligence API written in the Rails framework. It returns JSON data for Merchants, Customers, Invoices, Items, and Transactions.  In addition to RESTful show and index pages, there are several BI requests available. Please visit the version of this repo hosted on Heroku, and see below for specific API endpoints to visit.
https://boiling-retreat-20186.herokuapp.com/api/v1/items/1/best_day

## Getting Started

These instructions will get you a copy of the project up and running on your local machine for development and testing purposes.

### Prerequisites

Ruby 2+  
Rails 4+  
See Gemfile for required gems and their versions  

### Installing

To run a Rails Engine from your machine, fork and clone. Navigate to the desired project folder on your machine and clone down your version

From your terminal

```
cd rails_engine
```
```
bundle
```
```
rails db:create db:migrate
```

For the CSV data, visit https://github.com/turingschool-examples/sales_engine/tree/master/data.
Download and save to Rails_engine/db/csv
Then from your terminal, run this command to seed your database (this can take several minutes)

```
rake import:all
```

Be sure to run
```
rails c
```
...and check that each of the tables have Active Record instances:
```
Merchant.first
Customer.first
Invoice.first
Item.first
Item_invoice.first
Transaction.first
```

## Running the tests

To run the test suite, simply run the rspec terminal command from the root of the project
```
rspec
```
The test suite verifies the functionality of API endpoints for JSON data.


## Deployment

To deploy your very own Rails engine, start a server from the project root directory
```
rails s
```
and navigate to localhost3000/api/v1/merchants to get started.

In addition to RESTful show and index pages, there are several BI requests available:  
Each table has:  
/api/v1/table/find?=      #search by attribute or column name  
/api/v1/table/find_all?=  #search by attribute or column name  
/api/v1/table/random      #returns a random resource  

In addition, API requests can be made using these endpoints:  

Relationship Endpoints - Merchants  
	GET /api/v1/merchants/:id/items          returns a collection of items associated with that merchant  
	GET /api/v1/merchants/:id/invoices       returns a collection of invoices associated with that merchant from their   known orders  
Relationship Endpoints - Invoices  
	GET /api/v1/invoices/:id/transactions    returns a collection of associated transactions  
	GET /api/v1/invoices/:id/invoice_items   returns a collection of associated invoice items  
	GET /api/v1/invoices/:id/items           returns a collection of associated items  
	GET /api/v1/invoices/:id/customer        returns the associated customer  
	GET /api/v1/invoices/:id/merchant        returns the associated merchant  
Relationship Endpoints - Invoice Items  
	GET /api/v1/invoice_items/:id/invoice    returns the associated invoice  
	GET /api/v1/invoice_items/:id/item       returns the associated item  
Relationship Endpoints - Items  
	GET /api/v1/items/:id/invoice_items      returns a collection of associated invoice items  
	GET /api/v1/items/:id/merchant           returns the associated merchant  
Relationship Endpoints - Transactions    
	GET /api/v1/transactions/:id/invoice     returns the associated invoice  
Relationship Endpoints - Customers  
	GET /api/v1/customers/:id/invoices       returns a collection of associated invoices  
	GET /api/v1/customers/:id/transactions   returns a collection of associated transactions  

Business Intelligence Endpoints - All Merchants  
	GET /api/v1/merchants/most_revenue?quantity=x        
  returns the top x merchants ranked by total revenue  
	GET /api/v1/merchants/most_items?quantity=x       
  returns the top x merchants ranked by total number of items sold  
	GET /api/v1/merchants/revenue?date=x        
  returns the total revenue for date x across all merchants  
Business Intelligence Endpoints - Single Merchant   	
	GET /api/v1/merchants/:id/revenue       
  returns the total revenue for that merchant across successful transactions  
	GET /api/v1/merchants/:id/revenue?date=x        
  returns the total revenue for that merchant for a specific invoice date x  
	GET /api/v1/merchants/:id/favorite_customer         
  returns the customer who has conducted the most total number of successful transactions.  
	BOSS MODE: GET /api/v1/merchants/:id/customers_with_pending_invoices       
  returns a collection of customers which have pending (unpaid) invoices. A pending invoice has no transactions with a result of success.  
Business Intelligence Endpoints - Items  
	GET /api/v1/items/most_revenue?quantity=x         
  returns the top x items ranked by total revenue generated  
	GET /api/v1/items/most_items?quantity=x       
  returns the top x item instances ranked by total number sold  
	GET /api/v1/items/:id/best_day       
  returns the date with the most sales for the given item using the invoice date. If there are multiple days with equal number of sales, return the most recent day.  
Business Intelligence Endpoints - Customers  
	GET /api/v1/customers/:id/favorite_merchant        
  returns a merchant where the customer has conducted the most successful transactions  



## Authors

* **Lee Chow** [leepuppychow](https://github.com/leepuppychow)
* **Lauren Billington** [BLaurenB](https://github.com/blaurenb)

## License

This project is licensed under the MIT License - see the [LICENSE.md](LICENSE.md) file for details

## Acknowledgments

* The project and guidelines were developed by the Turing School of Software and Design.  www.turing.io
