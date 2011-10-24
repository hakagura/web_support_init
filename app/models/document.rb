class Document < ActiveRecord::Base
	mount_uploader :doc, DocUploader
end
