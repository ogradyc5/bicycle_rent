class UserBicyclesController < ApplicationController
  
  def create 
    bicycle = Bicycle.find_by_name(params[:bicycle_name])
    bicycle.inspect
    if bicycle.blank?
      bicycle = Bicycle.new_from_lookup(params[:bicycle_name])
      bicycle.inspect
      bicycle.save
    end
    @user_bicycle = UserBicycle.create(user: current_user, bicycle: bicycle)
    flash[:success] = "Bicycle #{@user_bicycle.bicycle.name} was successfully added to rent portfolio"
    redirect_to my_portfolio_path
  end
  
  def destroy
    bicycle = Bicycle.find(params[:id])
    @user_bicycle = UserBicycle.where(user_id: current_user.id, bicycle_id: bicycle.id).first
    @user_bicycle.destroy
    flash[:notice] = "Bicycle was successfully removed from rent portfolio"
    redirect_to my_portfolio_path
    
    
  end 
end
