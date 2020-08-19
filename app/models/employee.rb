
class Employee
  attr_reader :username, :role, :id, :password

  def initialize(attrs = {})
    @username  =  attrs[:username]
    @role = attrs[:role]
    @id = attrs[:id]
    @password = attrs[:password]
  end

  def manager?
    @role == "manager"
  end
end


# attrs = {
#   username: "miguel",
#   password: "secret",
#   id: 1,
#   role: "delivery_guy"
# }

# employee = Employee.new(attrs)

# some_code
