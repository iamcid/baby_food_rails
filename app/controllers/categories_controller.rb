class CategoriesController < ApplicationController

    before_action :redirect_if_not_logged_in

    def index
        @categories = Category.all
    end

    def new
        @category = Category.new
    end

    def destroy 
        @baby_food = BabyFood.find_by(params[:baby_food_id])
        category = Category.find_by(params[:category_id])
        category.destroy
        redirect_to categories_path
    end
end
