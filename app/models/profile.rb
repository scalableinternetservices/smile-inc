class Profile < ActiveRecord::Base
  belongs_to :user

  #declares that there is a file attached to profile called "avatar"
  #for users who haven't uploaded pictures create a folder called public/images/thumb/missing.png and public/images/medium/missing.png
  has_attached_file :avatar, :styles => {:medium=>"300x300>", :thumb =>"100x100#"}, :default_url => "/images/:style/missing.png"
  validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/
  end
