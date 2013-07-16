class CreateAdtadminAgentprofiles < ActiveRecord::Migration
  def change
    create_table :adtadmin_agentprofiles do |t|
      t.integer :region_id
      t.boolean :isactive, :default => 0
      t.boolean :isdelete, :default => 0
      t.string :name
      t.string :phone
      t.string :adress
      t.text :description
      t.string :photourl

      t.timestamps
    end
  end
end
