class UsersController  < ApplicationController
  
  def my_portfolio
    @user = current_user
    @user_bicycles = current_user.bicycles
    
  end 
end
