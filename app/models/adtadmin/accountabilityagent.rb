module Adtadmin
	class Accountabilityagent < ActiveRecord::Base
		attr_accessible :agentprofile_id, :post_id
		belongs_to :agentprofile
		belongs_to :post

	end 
end
