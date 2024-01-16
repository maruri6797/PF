# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# Add Admin user
Admin.find_or_create_by!(email: 'admin1@test.com') do |admin|
  admin.company = "A Company",
  admin.name = "John",
  admin.phone = "00011112222",
  admin.password = "admin1"
end

Admin.find_or_create_by!(email: 'admin2@test.com') do |admin|
  admin.company = "B company",
  admin.name = "Mary",
  admin.phone = "11122223333",
  admin.password = "admin2"
end

# Add Customer user
10.times do |n|
  Customer.find_or_create_by!(email: 'customer@test.com') do |customer|
    customer.company = "#{n+1}Company",
    customer.first_name = "customer",
    customer.last_name = "#{n+1}"
    customer.phone = "0000000000#{n+1}"
    customer.password = "customer#{n+1}"
  end
end