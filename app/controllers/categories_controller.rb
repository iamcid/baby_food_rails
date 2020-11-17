class CategoriesController < ApplicationController

    before_action :redirect_if_not_logged_in

    def index
        @categories = Category.all
    end

    def new
        @category = Category.new
    end

    def edit
        @category = Category.find(params[:id])
    end
end
