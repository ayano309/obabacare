class MealsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_vital
  
  def new
    @meal = current_user.meals.new
  end
  
  
  def create
    @meal = current_user.meals.new(meal_params)
    @meal.vital_id = @vital.id
    if @meal.save
      redirect_to vitals_path, notice: '保存できました'
    else
      flash.now[:error] = '保存に失敗しました'
      render :new
    end
  end

  def destroy
    @meal = @vital.meals.find(params[:id])
    @meal.destroy
    redirect_to vitals_path
  end

  

  private
  def set_vital
    @vital = Vital.find(params[:vital_id])
  end

  def meal_params
    params.require(:meal).permit(:time_period, :meal_quantity)
  end
end
