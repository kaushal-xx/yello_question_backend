class Account < ApplicationRecord
	self.table_name = "account"

	has_many :user_redeem_activity


	def total_redeem
		self.user_redeem_activity.sum(:redeem_points)
	end
end