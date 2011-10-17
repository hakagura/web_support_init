class Ticket < ActiveRecord::Base
	before_save :slugando
	has_many :messages, :dependent => :destroy
	belongs_to :user
	belongs_to :developer, :class_name => "User", :foreign_key => "developer_id"
	validates_presence_of :summary, :description, :priority
	validates_uniqueness_of :summary
  	mount_uploader :image, ImageUploader
	
	#def to_param
	#	slug
	#end
	def slugando
		self.slug = summary.parameterize.to_s
	end

	def toggle_lock
		self.time = Time.now.utc - self.created_at
	  	self.status = "Closed"
	  	self.save
  	end

end
