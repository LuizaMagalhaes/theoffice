class Employee 
  attr_reader :id, :email, :first_name, :last_name, :avatar

  def initialize(attributes = {})
    @email = attributes[:email]
    @first_name = attributes[:first_name]
    @last_name = attributes[:last_name]
    @avatar = attributes[:avatar]
  end
end
