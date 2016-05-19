class AddShopListToAilments < ActiveRecord::Migration
  def change
    add_column :ailments, :shopping_list, :string
  end
end
