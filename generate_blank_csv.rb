# Imports the ATTRIBUTES and GIFTS from the other file
require_relative "gifts_and_features"

require "csv"

csv_file_path = "gift_features.csv"

if File.exist?(csv_file_path) == false

  # Write to a new CSV file (serializing)
  CSV.open(csv_file_path, "w") do |csv|
    FEATURES.each do |feature|
      GIFTS.each do |gift|
        csv << [gift[:name], feature[:name]]
      end
    end
  end
else
  puts "File already exists"
end
