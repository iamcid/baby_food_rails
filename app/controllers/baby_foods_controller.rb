class BabyFoodsController < ApplicationController

    before_action :redirect_if_not_logged_in

    def new
        @baby_food = BabyFood.new
        @baby_food.build_category
    end

    def create
        @baby_food = BabyFood.new(baby_food_params)
        @baby_food.user_id = session[:user_id]
        if @baby_food.save
            redirect_to baby_food_path(@baby_food)
        else
            @baby_food.build_category
            render :new
        end
    end

    def index
        @baby_foods = BabyFood.alpha
    end

    def show
        @baby_food = BabyFood.find_by_id(params[:id])
    end

    def edit
        @baby_food = BabyFood.find(params[:id])
    end

    def update
        @baby_food = BabyFood.find(params[:id])
        @baby_food.update(name: params[:baby_food][:name], description: params[:baby_food][:description])
        redirect_to baby_food_path(@baby_food)
    end

    def destroy 
        @baby_food = BabyFood.find(params[:baby_food_id])
        review = Review.find(params[:id])
        if current_user.id == review.user_id
            review.destroy
        else
            flash[:notice] = "You can't delete that user's review!"
        end
            redirect_to baby_food_reviews_path(@baby_food)
    end
    
    private

    def baby_food_params
        params.require(:baby_food).permit(:name, :description, :category_id, category_attributes: [:name])
    end
end
