class User < ActiveRecord::Base
  bad_attribute_names :class
  
  validates_presence_of :class_name
  
  def class_name= value
    self[:class] = value
  end
  
  def class_name
    self[:class]
  end
end
