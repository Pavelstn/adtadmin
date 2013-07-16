class AddOrderToRegions < ActiveRecord::Migration
  def change
  	add_column :adtadmin_regions, :rorder, :integer
  end
end
