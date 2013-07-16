module Adtadmin
	class Partner < ActiveRecord::Base
		attr_accessible :aliasname, :description, :isactive, :isdelete, :name
		has_many :post
	end
end
