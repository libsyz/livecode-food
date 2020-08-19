class Router
  def initialize(meals_controller, customers_controller, sessions_controller)
    @meals_controller = meals_controller
    @customers_controller = customers_controller
    @sessions_controller = sessions_controller
    @running = true
  end

  def run
    while @running
      @user = @sessions_controller.sign_in
      while @user
        if @user.manager?
          print_manager_menu
          choice = gets.chomp.to_i
          print `clear`
          route_manager_action(choice)
        else
          print_delivery_menu
          choice = gets.chomp.to_i
          print `clear`
          route_deliver_action(choice)
        end
      end
    end
  end

  private

  def print_manager_menu
    puts "--------------------"
    puts "------- MENU -------"
    puts "--------------------"
    puts "1. Add new meal"
    puts "2. List all meals"
    puts "3. Add new customer"
    puts "4. List all customers"
    puts "8. Log Out"
    puts "9. Shut Down"
    print "> "
  end

  def print_delivery_menu
    puts "--------------------"
    puts "------- MENU -------"
    puts "--------------------"
    puts "1. See my orders"
    puts "2. Mark order as delivered"
    puts "8. Log Out"
    puts "9. Shut Down"
    print "> "
  end



  def route_manager_action(choice)
    case choice
    when 1 then @meals_controller.add
    when 2 then @meals_controller.list
    when 3 then @customers_controller.add
    when 4 then @customers_controller.list
    when 8 then @user = nil
    when 9 then stop!
    else puts "Try again..."
    end
  end

  def route_deliver_action(choice)
    case choice
    when 1 then puts "work in progress"
    when 2 then puts "work in progress"
    when 8 then @user = nil
    when 9 then stop!
    else puts "Try again..."
    end
  end

  def stop!
    @user = nil
    @running = false
  end
end
