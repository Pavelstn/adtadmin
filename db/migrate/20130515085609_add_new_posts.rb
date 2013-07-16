class AddNewPosts < ActiveRecord::Migration
def change
    create_table :adtadmin_posts do |t|
      t.integer :user_id
      t.integer :region_id
      t.integer :category_id
      t.string :altname

      t.string :title
      t.text :text
      t.string :contact

      t.string :tags
      t.float :price

      t.boolean :isactive, :default => 0
      t.boolean :isdelete, :default => 0
      t.boolean :ontop, :default => 0

      t.string :imageurl
      t.integer :partner_id
      t.string :district
      t.string :space
      t.string :floor
      t.string :material
      t.string :plan
      t.string :year
      t.string :conditionbuilding
      t.string :apartmentstate
      t.boolean :balcony, :default => 0
      t.boolean :phone, :default => 0

      t.timestamps
    end
  end
end
