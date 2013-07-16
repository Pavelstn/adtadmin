module Adtadmin
	class Type < ActiveRecord::Base
		attr_accessible :alias, :isactive, :isdelete, :name
		has_many :category

		def self.all_active()
			Type.where( :isactive=>1)
		end
	end
end
