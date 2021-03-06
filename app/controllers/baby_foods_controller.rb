class BabyFoodsController < ApplicationController
    before_action :set_baby_food, only: [:show, :edit, :update]
    before_action :redirect_if_not_logged_in

    def new
        @baby_food = BabyFood.new
        @baby_food.build_category
    end

    def create
        
        if params[:baby_food][:category_id]
            @baby_food = BabyFood.new(just_baby_food_params)
            @baby_food.category = Category.find(params[:baby_food][:category_id])
        else
            @baby_food = BabyFood.new(baby_food_params)
        end

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
        # @baby_food = BabyFood.find_by_id(params[:id])
    end

    def edit
        # @baby_food = BabyFood.find(params[:id])
    end

    def update
        if @baby_food.update(baby_food_params)
            redirect_to baby_food_path(@baby_food)
        else
            render :edit
        end
    end

    def destroy 
        @baby_food = BabyFood.find(params[:id])
        current_user.id == @baby_food.user_id
        @baby_food.destroy
        redirect_to baby_foods_path
    end
    
    private

    def baby_food_params
        params.require(:baby_food).permit(:name, :description, :category_id, category_attributes: [:name])
    end

    def just_baby_food_params
        params.require(:baby_food).permit(:name, :description, :category_id)
    end

    def set_baby_food
        @baby_food = BabyFood.find_by(params[:id])
        redirect_to baby_foods_path if !@baby_food
    end
end
