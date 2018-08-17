require 'csv'

namespace :import do
  desc "Import customers csv data"
  task customers: :environment do
    pbar = ProgressBar.create(:title => "Customers", :total => (CSV.read('./data/customers.csv')).count, :format => "%a %b\u{263E}%i %p%% %t", :progress_mark  => ' ', :remainder_mark => "\u{FF65}", :starting_at => 1)
    CSV.foreach('./data/customers.csv', { headers: true, header_converters: :symbol } ) do |row|
      pbar.increment
      Customer.find_or_create_by(row.to_h)
    end
    puts "Customers Imported: #{Customer.all.count}"
  end

  desc "Import merchants csv data"
  task merchants: :environment do
    pbar = ProgressBar.create(:title => "Merchants", :total => (CSV.read('./data/merchants.csv')).count, :format => "%a %b\u{263E}%i %p%% %t", :progress_mark  => ' ', :remainder_mark => "\u{FF65}", :starting_at => 1)
    CSV.foreach('./data/merchants.csv', { headers: true, header_converters: :symbol } ) do |row|
      pbar.increment
      Merchant.find_or_create_by(row.to_h)
    end
    puts "Merchants Imported: #{Merchant.all.count}"
  end

  desc "Import invoices csv data"
  task invoices: :environment do
    pbar = ProgressBar.create(:title => "Invoices", :total => (CSV.read('./data/invoices.csv')).count, :format => "%a %b\u{263E}%i %p%% %t", :progress_mark  => ' ', :remainder_mark => "\u{FF65}", :starting_at => 1)
    CSV.foreach('./data/invoices.csv', { headers: true, header_converters: :symbol } ) do |row|
      pbar.increment
      Invoice.find_or_create_by(row.to_h)
    end
    puts "Invoices Imported: #{Invoice.all.count}"
  end

  desc "Import items csv data"
  task items: :environment do
    pbar = ProgressBar.create(:title => "Items", :total => (CSV.read('./data/items.csv')).count, :format => "%a %b\u{263E}%i %p%% %t", :progress_mark  => ' ', :remainder_mark => "\u{FF65}", :starting_at => 1)
    CSV.foreach('./data/items.csv', { headers: true, header_converters: :symbol } ) do |row|
      pbar.increment
      Item.find_or_create_by(row.to_h)
    end
    puts "Items Imported: #{Item.all.count}"
  end

  desc "Import invoice_items csv data"
  task invoice_items: :environment do
    pbar = ProgressBar.create(:title => "InvoiceItems", :total => (CSV.read('./data/invoice_items.csv')).count, :format => "%a %b\u{263E}%i %p%% %t", :progress_mark  => ' ', :remainder_mark => "\u{FF65}", :starting_at => 1)
    CSV.foreach('./data/invoice_items.csv', { headers: true, header_converters: :symbol } ) do |row|
      pbar.increment
      InvoiceItem.find_or_create_by(row.to_h)
    end
    puts "Invoice Items Imported: #{InvoiceItem.all.count}"
  end

  desc "Import transactions csv data"
  task transactions: :environment do
    pbar = ProgressBar.create(:title => "Transactions", :total => (CSV.read('./data/transactions.csv')).count, :format => "%a %b\u{263E}%i %p%% %t", :progress_mark  => ' ', :remainder_mark => "\u{FF65}", :starting_at => 1)
    CSV.foreach('./data/transactions.csv', { headers: true, header_converters: :symbol } ) do |row|
      pbar.increment
      Transaction.find_or_create_by(row.to_h)
    end
    puts "Transactions Imported: #{Transaction.all.count}"
  end

  task all: [:customers, :merchants, :invoices, :items, :invoice_items, :transactions] do
  end
end
