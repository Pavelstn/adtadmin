module Adtadmin
	class Category < ActiveRecord::Base
  		attr_accessible :alias, :name, :isdelete, :isactive, :type_id, :private_name, :full_name
  		has_many :post
  		belongs_to :type

  		def self.all_active()
			Category.where( :isactive=>1)
  		end
  
	end
end
