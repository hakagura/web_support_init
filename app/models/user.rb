class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
<<<<<<< HEAD
  attr_accessible :email, :password, :password_confirmation, :remember_me, :role
=======
  #attr_accessible :email, :password, :password_confirmation, :remember_me, :role
  
  validates_presence_of :name, :role
>>>>>>> 8798e2b85b0c9390316ce5b44415a959f49264ce

  ROLES = %w[admin user]

  has_many :messages
  has_many :tickets
end
