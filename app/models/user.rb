class User < ActiveRecord::Base
	self.primary_key = :user_id

	def search
		User.all
	end	
end
