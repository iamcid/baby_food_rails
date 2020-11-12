class BabyFoodsController < ApplicationController

    def new
        @baby_food = BabyFood.new
        @baby_food = build_category
    end

    def create
        @baby_food = BabyFood.new(baby_food_params)
        @baby_food.user_id = session[:user_id]
        if @baby_food.save
            redirect_to baby_food_path(@baby_food)
        else
            render :new
        end
    end

    private

    def baby_food_params
        params.require(baby_food).permit(:name, :description, :category_id, category_attributes: [:name])
    end
end
