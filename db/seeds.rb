# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# Create admin user

User.create(email: 'admin@blog.com', password: 'admin123', password_confirmation: 'admin123', first_name: 'Admin', last_name: 'Blog', admin: true)