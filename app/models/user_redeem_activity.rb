class UserRedeemActivity < ApplicationRecord
	self.table_name = "user_redeem_activity"

	belongs_to :account 

	def email
		self.account.try(&:email)
	end
end