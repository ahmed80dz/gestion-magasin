class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable, :lockable and :timeoutable
  ROLE = [:root,:admin,:user,:guest]
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable

  # Setup accessible (or protected) attributes for your model
  validates_uniqueness_of :login
  validates_presence_of :login, :password
  validates_confirmation_of :password
  attr_accessible :login, :role, :password, :password_confirmation, :remember_me
  def role?(r)
  	r == ROLE[role]
  end
end
