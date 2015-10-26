class AddCusineTypeIdToRestaurants < ActiveRecord::Migration
  def change
    add_column :restaurants, :cusine_type_id, :integer
  end
end
