module UserHelper
	def users_admins
		User.where("role = ?","admin")
	end
end
