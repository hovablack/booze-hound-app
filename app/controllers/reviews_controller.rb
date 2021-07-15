class ReviewsController < ApplicationController
  before_action :login_required, only: [:index, :new, :create]

  def index
    if params[:drink_id] && @drink = Drink.find_by_id(params[:drink_id])
      @reviews = @drink.reviews
    else
      flash.now[:danger] = "Can't find drink!"
      @reviews = Review.all
    end
  end

  def new
    if params[:drink_id] && @drink = Drink.find_by_id(params[:drink_id])
      @reviews = @drink.reviews.build
    else
      flash.now[:danger] = "Can't find drink!"
      @review = Review.new
    end
  end

  def show
    @review - Review.find(id: params[:id])
  end

  def create
    @review = current_user.reviews.build(review_params(:content, :drink_id))
    if @review.save
      flash[:success] = "Review created!"
      redirect_to drink_reviews_path(@drink)
    else
      render :new
    end
  end

  private

  def review_params(*args)
    params.require(:review).permit(*args)
  end
end
