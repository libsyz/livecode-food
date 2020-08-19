require 'pry-byebug'
require_relative '../views/sessions_view'

class SessionsController

  def initialize(employee_repository)
    @sessions_view = SessionsView.new
    @employee_repository = employee_repository
  end
  def sign_in
    # ask for a username

    username = @sessions_view.ask_user_for("username")
    password = @sessions_view.ask_user_for("password")
    # ask for a password
    user = @employee_repository.find_by_username(username)
    # match it to the database
    # if the user exists
    if user && user.password == password
      puts "Success!"
      user
    else
      puts "Wrong creds!"
      sign_in # recursive call
    end
    # and the password belongs to the user
    # - > Success
    # els
    # - > Wrong credentials
    # - > Keep trying
  end
end
