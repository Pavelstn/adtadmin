module Adtadmin
	class Image < ActiveRecord::Base
		attr_accessible :order, :post_id, :purpose_id, :url
		belongs_to :post
	end  
end
