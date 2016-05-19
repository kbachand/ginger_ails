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