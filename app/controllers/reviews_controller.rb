class ReviewsController < ApplicationController

    before_action :redirect_if_not_logged_in

    def new
        if @baby_food = BabyFood.find_by_id(params[:baby_food_id])
            @review = @baby_food.reviews.build
        else
            @review = Review.new
        end
    end

    def create
        @review = current_user.reviews.build(review_params)
        if @review.save
            redirect_to review_path(@review)
        else
            render :new
        end
    end

    def show
        @review = Review.find_by_id(params[:id])
    end

    def index
        if @baby_food = BabyFood.find_by_id(params[:baby_food_id])
            @reviews = @baby_food.reviews
        else
            @reviews = Review.all
        end
    end

    def edit
        @review = Review.find(params[:id])
    end

    def update
        @review = Review.find(params[:id])
        @review.update(thumbs_up: params[:review][:thumbs_up], content: params[:review][:content])
        redirect_to review_path(@review)
    end

    private

    def review_params
        params.require(:review).permit(:baby_food_id, :thumbs_up, :content)
    end

end
