class BabyFoodsController < ApplicationController

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
        @baby_foods = BabyFood.all
    end

    def show
        @baby_food = BabyFood.find_by_id(params[:id])
    end

    private

    def baby_food_params
        params.require(:baby_food).permit(:name, :description, :category_id, category_attributes: [:name])
    end
end
