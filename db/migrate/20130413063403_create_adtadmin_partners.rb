class CreateAdtadminPartners < ActiveRecord::Migration
  def change
    create_table :adtadmin_partners do |t|
      t.string :name
      t.string :aliasname
      t.text :description
      t.boolean :isactive, :default => 0
      t.boolean :isdelete, :default => 0

      t.timestamps
    end
  end
end
