class Ticket < ActiveRecord::Base
	before_save :slugando 
	has_many :messages, :dependent => :destroy
	belongs_to :user
	validates_presence_of :summary, :description, :priority
	validates_uniqueness_of :summary
  belongs_to :developer,:class_name => "User",:foreign_key => "developer_id"
    mount_uploader :image, ImageUploader
    mount_uploader :doc, ImageUploader

	#def to_param
	#	slug
	#end


	def slugando
		self.slug = summary.parameterize.to_s
	end
end
