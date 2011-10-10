class Message < ActiveRecord::Base
	belongs_to :ticket
	belongs_to :user
	validates_presence_of :content
	attr_accessible :content, :user_id, :ticket_id
end
