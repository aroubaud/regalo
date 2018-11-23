# Importing attributes and gifts from other file
require_relative "../gifts_and_features"

GiftFeature.destroy_all
Gift.destroy_all
Feature.destroy_all

# Create attributes
FEATURES.each do |feature|
  Feature.create!(feature)
end

# Create gifts
GIFTS.each do |gift|
  Gift.create!(gift)
end

csv_file_path = "gift_features.csv"

# Read from that CSV file (parsing)
# Create "gift attributes"
CSV.foreach(csv_file_path) do |row|
  p row
  gift_name = row[0]
  feature_name = row[1]
  strength = row[2].to_i

  gift_object = Gift.find_by(name: gift_name)
  p feature_name
  feature_object = Feature.find_by(name: feature_name)

  # Once you generated the gift attribute model
  GiftFeature.create({ gift: gift_object, feature_id: feature_object.id, strength: strength })
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

