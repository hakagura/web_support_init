class Ticket < ActiveRecord::Base
	before_save :slugando 
	has_many :messages, :dependent => :destroy
	belongs_to :user
	#belongs_to :developer, :class_name => "User", :foreign_key => "developer_id"
	validates_presence_of :summary, :description, :priority
	validates_uniqueness_of :summary
    belongs_to :developer,:class_name => "User",:foreign_key => "developer_id"
    mount_uploader :image, ImageUploader
    #mount_uploader :doc, ImageUploader
    has_many :documents
    accepts_nested_attributes_for :documents, :allow_destroy => true

    #default_scope :order => 'created_at DESC'

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
