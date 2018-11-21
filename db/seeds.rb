# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


attributes = [
  {name: 'Sports'}, {name: 'Techie'}, {name: 'Fashionista'}, {name: 'Foodie'},
  {name: 'Outgoing person'}, {name: 'Male'}, {name: 'Female'}, {name: 'Other'},
  {name: 'Friend'}, {name: 'Boss'}, {name: 'Colleague'}, {name: 'Family'},
  {name: 'Kid'}, {name: 'Teen'}, {name: 'Young adult'}, {name: 'Adult'},
  {name: 'Elderly'}, {name: 'Birthday'}, {name: 'Party'}, {name: 'Wedding'},
  {name: 'Graduation'}, {name: 'Babyshower'}, {name: 'Christmas'},
  {name: 'Office party'}, {name: 'Other'}
]

attributes.each do |attribute|
  Attribute.create(attribute)
end
