class Document < ActiveRecord::Base
	mount_uploader :doc, ImageUploader
end
