class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  attr_accessor :login
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :authentication_keys => [:login]

  validates :username,
            :presence => true,
            :uniqueness => {
              :case_sensitive => false
            }
  has_one :profile

  has_many :comment

  #creates profile at user registration
#  before_create :build_profile
  after_create :create_profile

  #secure validation of username to prevent putting email as username
  def validate_username
    if User.where(email: username).exist?
      errors.add(:username, :invalid)
    end
  end

  def login=(login)
    @login = login
  end

  def login
    @login || self.username || self.email
  end
  
  #fix for mysql ignoring index in the email col
  def self.find_for_database_authentication(warden_conditions)
    conditions = warden_conditions.dup
    if login = conditions.delete(:login)
      where(conditions.to_hash).where(["username = :value OR lower(email) = lower(:value)", { :value => login }]).first
    else
      conditions[:email].downcase! if conditions[:email]
      where(conditions.to_hash).first
    end
  end

  # FOLLOWER FEATURE RELATION
  has_many :active_relationships, class_name:  "Relationship",
  	   			  foreign_key: "follower_id",
				  dependent:   :destroy
  has_many :following, through: :active_relationships, source: :followed

  has_many :passive_relationships, class_name:  "Relationship",
  	   			   foreign_key: "followed_id",
				   dependent:   :destroy
  has_many :followers, through: :passive_relationships, source: :follower


  # FOLLOWER FUNCTIONS
  def follow(other_user)
    active_relationships.create(followed_id: other_user.id)
  end

  def unfollow(other_user)
    active_relationships.find_by(followed_id: other_user.id).destroy
  end

  def following?(other_user)
    following.include?(other_user)
  end
  
end
