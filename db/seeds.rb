# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# Add Admin user
admin1 = Admin.find_or_create_by!(email: 'admin1@test.com') do |admin|
  admin.company = "ACompany"
  admin.name = "John"
  admin.phone = "00011112222"
  admin.password = "admin1"
end

admin2 = Admin.find_or_create_by!(email: 'admin2@test.com') do |admin|
  admin.company = "Bcompany"
  admin.name = "Mary"
  admin.phone = "11122223333"
  admin.password = "admin2"
end

# Add Customer user
customer1 = Customer.find_or_create_by!(email: 'customer1@test.com') do |customer|
  customer.admin_id = 1
  customer.company = "Zcompany"
  customer.first_name = "Hanako"
  customer.last_name = "Tanaka"
  customer.phone = "22233334444"
  customer.password = "customer1"
end

customer2 = Customer.find_or_create_by!(email: 'customer2@test.com') do |customer|
  customer.admin_id = 1
  customer.company = "Ycompany"
  customer.first_name = "Luca"
  customer.last_name = "Smith"
  customer.phone = "33344445555"
  customer.password = "customer2"
end

customer3 = Customer.find_or_create_by!(email: 'customer3@test.com') do |customer|
  customer.admin_id = 2
  customer.company = "Xcompany"
  customer.first_name = "Bill"
  customer.last_name = "Liam"
  customer.phone = "44455556666"
  customer.password = "customer3"
end

customer4 = Customer.find_or_create_by!(email: 'customer4@test.com') do |customer|
  customer.admin_id = 2
  customer.company = "Vcompany"
  customer.first_name = "Robert"
  customer.last_name = "Arthur"
  customer.phone = "55566667777"
  customer.password = "customer4"
end
