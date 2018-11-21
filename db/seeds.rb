# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# Importing attributes and gifts from other file
require_relative "../gifts_and_attributes"

GiftAttribute.destroy_all
Gift.destroy_all
Attribute.destroy_all

# Create attributes
ATTRIBUTES.each do |attribute|
  Attribute.create!(attribute)
end

# Create gifts
GIFTS.each do |gift|
  Gift.create!(gift)
end

csv_file_path = "gift_attributes.csv"

# Read from that CSV file (parsing)
# Create "gift attributes"
CSV.foreach(csv_file_path) do |row|
  p row
  gift_name = row[0]
  attribute_name = row[1]
  strength = row[2].to_i

  gift_object = Gift.find_by(name: gift_name)
  p attribute_name
  attribute_object = Attribute.find_by(name: attribute_name)

  # Once you generated the gift attribute model
  GiftAttribute.create({ gift: gift_object, attribute_id: attribute_object.id, strength: strength })
end


# gift_attributes = [
#   { gift: "chocolate", attribute: "Sports", strength: 0 },

# ]

# gift_attributes.each do |gift_attribute_hash|
#   gift = Gift.find_by({ name: gift_attribute_hash[:gift] })
#   attribute = Attribute.find_by({ name: gift_attribute_hash[:gift] })

#   GiftAttribute.create({ gift: gift, attribute: attribute, strength: gift_attribute_hash[:strength] })

# end

# Running show attributes

