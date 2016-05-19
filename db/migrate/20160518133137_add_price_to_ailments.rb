class AddPriceToAilments < ActiveRecord::Migration
  def change
    add_column :ailments, :price, :decimal
  end
end
