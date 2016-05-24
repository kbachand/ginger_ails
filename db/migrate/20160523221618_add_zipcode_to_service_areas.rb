class AddZipcodeToServiceAreas < ActiveRecord::Migration
  def change
    add_column :service_areas, :zipcode, :string
  end
end
