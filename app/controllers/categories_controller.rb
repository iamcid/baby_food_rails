class CategoriesController < ApplicationController

    before_action :redirect_if_not_logged_in

    def index
        @categories = Category.all
    end

    def new
        @category = Category.new
    end

    def destroy 
        @category= Category.find(params[:id])
        @category.destroy
        redirect_to categories_path
    end
end
