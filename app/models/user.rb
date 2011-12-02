class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  #attr_accessible :email, :password, :password_confirmation, :remember_me, :role
  
  validates_presence_of :name, :role

  ROLES = %w[admin user]

  has_many :messages
  has_many :tickets

  def self.emails
    emails = User.where(:role => 'admin')
    emails.collect(&:email).join(', ')
  end

end
