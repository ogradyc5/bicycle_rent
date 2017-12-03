class BicyclesController < ApplicationController
    
    def search
     if params[:bicycle].blank?
      flash.now[:danger]="You've entered an empty search string"
     else
      @bicycle = Bicycle.new_from_lookup(params[:bicycle])
      flash.now[:danger] = "You've entered an incorrect symbol" unless @bicycle
     end
     render partial: 'users/result'
    end
    
end 