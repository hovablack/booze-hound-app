class ReviewsController < ApplicationController

  def new
    @drink = Drink.find_by_id(params[:drink_id])
    @review = @drink.reviews.build
  end

  def index
    
  end
end
