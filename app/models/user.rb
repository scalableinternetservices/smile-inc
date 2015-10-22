class User < ActiveRecord::Base
  validates :username, presence: true, uniqueness:true, length: { maximum: 32 }
  attr_accessor :login
  has_one :profile
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end
