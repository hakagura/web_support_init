class Ticket < ActiveRecord::Base
	before_save :slugando, :set_status
	has_many :messages, :dependent => :destroy
	belongs_to :user
	validates_presence_of :summary, :description, :priority
	validates_uniqueness_of :summary
  mount_uploader :image, ImageUploader
	
	#def to_param
	#	slug
	#end

	def set_status
		self.status = "Open"
	end

	def slugando
		self.slug = summary.parameterize.to_s
	end
end
