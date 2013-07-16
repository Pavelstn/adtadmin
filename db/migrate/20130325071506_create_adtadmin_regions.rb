class CreateAdtadminRegions < ActiveRecord::Migration
  def change
    create_table :adtadmin_regions do |t|
      t.string :name
      t.string :alias
      t.boolean :isdelete, :default => 0
      t.boolean :isactive, :default => 0

      t.timestamps
    end
  end
end
