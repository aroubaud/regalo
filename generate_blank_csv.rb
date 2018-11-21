# Imports the ATTRIBUTES and GIFTS from the other file
require_relative "gifts_and_attributes"

require "csv"

csv_file_path = "gift_attributes.csv"

if File.exist?(csv_file_path) == false

  # Write to a new CSV file (serializing)
  CSV.open(csv_file_path, "w") do |csv|
    ATTRIBUTES.each do |attribute|
      GIFTS.each do |gift|
        csv << [gift[:name], attribute[:name]]
      end
    end
  end
else
  puts "File already exists"
end
