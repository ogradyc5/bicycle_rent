class RentalsController < ApplicationController
  before_action :set_rental, only: [:show, :edit, :update, :destroy]
  before_action :set_bicycle
  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]

  def index
    @rentals = Rental.all
  end

  def show
  end

  def new
    @rental = @bicycle.rentals.new
  end

  def edit
  end

  def create
    @rental = @bicycle.rentals.new(rental_params)
    @rental.user = current_user

    respond_to do |format|
      if @rental.save
        format.html { redirect_to bicycle_rental_path(@rental.bicycle, @rental), notice: 'Rental was successfully created.' }
        format.json { render :show, status: :created, location: @rental }
      else
        format.html { render :new }
        format.json { render json: @rental.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @rental.update(rental_params)
        format.html { redirect_to bicycle_rental_path(@rental.bicycle, @rental), notice: 'Rental was successfully updated.' }
        format.json { render :show, status: :ok, location: @rental }
      else
        format.html { render :edit }
        format.json { render json: @rental.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @rental.destroy
    respond_to do |format|
      format.html { redirect_to bicycle_rentals_url, notice: 'Rental was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def set_rental
      @rental = Rental.find(params[:id])
    end

    def set_bicycle
      @car = Bicycle.find(params[:bicycle_id])
    end

    def rental_params
      params.require(:rental).permit(:starts_on, :ends_on, :bicycle)
    end
end