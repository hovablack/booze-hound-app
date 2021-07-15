class DrinksController < ApplicationController
  before_action :login_required, only: [:index, :show, :edit, :update]
  def index
    @drinks = Drink.alpha
  end

  def new
    @drink = Drink.new
  end

  def show
    @drink = Drink.find(params[:id])
    @reviews = @drink.reviews
  end

  def create
    @drink = current_user.drinks.build(drink_params(:name, :description))
    if @drink.save
      flash[:success] = "Added a new drink"
      redirect_to @drink
    else
      render :new
    end
  end

  private

  def drink_params(*args)
    params.require(:drink).permit(*args)
  end
end
