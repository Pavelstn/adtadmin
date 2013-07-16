class CreateAdtadminAccountabilityagents < ActiveRecord::Migration
  def change
    create_table :adtadmin_accountabilityagents do |t|
      t.integer :post_id
      t.integer :agentprofile_id

      t.timestamps
    end
  end
end
