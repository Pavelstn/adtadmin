class CreateAdtadminCategories < ActiveRecord::Migration
  def change
    create_table :adtadmin_categories do |t|
      t.string :name
      t.string :alias
      t.boolean :isactive, :default => 0
      t.boolean :isdelete, :default => 0
	  t.integer :type_id
      t.string :private_name
      t.string :full_name
  
      t.timestamps
    end
  end
end
