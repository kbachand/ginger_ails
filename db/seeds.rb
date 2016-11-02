# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
require 'csv'
namespace :import_ailment do
desc "Import ailment from a CSV file"
task ailments: :environment do
CSV.foreach("ailments.csv") do |row|
    name, description, shopping_list, price = row
    Ailment.create(name: name, description: description, shopping_list: shopping_list, price: price)
    end
  end
end
