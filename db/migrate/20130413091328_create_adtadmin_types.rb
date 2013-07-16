class CreateAdtadminTypes < ActiveRecord::Migration
  def change
    create_table :adtadmin_types do |t|
      t.string :name
      t.string :alias
      t.boolean :isactive, :default => 0
      t.boolean :isdelete, :default => 0

      t.timestamps
    end
  end
end
