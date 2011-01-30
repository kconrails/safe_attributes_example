require 'test_helper'

class UserTest < ActiveSupport::TestCase
  test "class_name writes to class attribute" do
    u = User.new
    
    u.class_name = 'class of 1995'
    assert_equal 'class of 1995', u[:class]
  end
  
  test "class_name reads from class attribute" do
    u = User.new
    
    u[:class] = 'class of 1995'
    assert_equal 'class of 1995', u.class_name
  end
  
  test "validates presence of class_name" do
    error_message = "can't be blank"
    
    u = User.new :class_name => 'class of 1995'
    u.valid?
    assert !Array(u.errors[:class_name]).include?(error_message)
    
    u.class_name = nil
    assert !u.valid?
    assert Array(u.errors[:class_name]).include?(error_message)
    
    u.class_name = ''
    assert !u.valid?
    assert Array(u.errors[:class_name]).include?(error_message)
  end
end
