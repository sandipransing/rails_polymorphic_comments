class Comment < ActiveRecord::Base
  # *** Polymorphic model  ***
  
  # Polymorphic implies that it will create fields as 
  # resource_id and resource_type in table
  # Benefit of using polymorphic => Different resources of any type can have 
  # association with comments ( one - one, one -many, etc. )
  # Associated model should have realationship as
  # has_many :comments, :as => :resource
  belongs_to :resource
  
  # Comment body cant be blank
  validates_presence_of :body
  
  def before_save
     #  Ensure blacklisted words are not get entered into comment body
     self.body.gsub!(/ ass | fuck | bitch /, '')
  end

end
