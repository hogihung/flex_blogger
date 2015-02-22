class CategoriesController < ApplicationController
  before_action :set_category, only: [:edit, :update, :destroy]
  before_action :check_user
  before_action :admin?, except: [:index]

  respond_to :html

  def index
    @categories = Category.all
    respond_with @categories
  end

  def new
    @category = Category.new
  end

  def edit
  end

  def create
    @category = Category.new(category_params)
    flash[:success] = "Successfully created category." if @category.save
    respond_with @category, location: categories_path
  end

  def update
    flash[:success] = "Successfully updated category." if @category.update(category_params)
    respond_with @category, location: categories_path
  end

  def destroy
    @category.destroy
    redirect_to categories_path, alert: "Successfully deleted category."
  end

  private

    def set_category
      @category = Category.find(params[:id])
    end

    def category_params
      params.require(:category).permit(:description)
    end
end
