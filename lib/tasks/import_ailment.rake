require 'csv'
namespace :import_ailment do
desc "Import ailment from a CSV file"
task ailments: :environment do
CSV.foreach("ailments.csv") do |row|
    name, description = row
    Ailment.create(name: name, description: description)
    end
  end
end