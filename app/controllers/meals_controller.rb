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
  
  def edit
    @meal = @vital.meals.find(params[:id])
  end
  
  def update
    @meal = @vital.meals.find(params[:id])
    
    if @meal.update(meal_params)
      redirect_to vitals_path, notice: '更新できました'
    else
      flash.now[:error] = '更新できませんでした'
      render :edit
    end
  end

  def destroy
    @meal = @vital.meals.find(params[:id])
    @meal.destroy
    redirect_to vitals_path, notice: '削除できました'
  end

  

  private
  def set_vital
    @vital = Vital.find(params[:vital_id])
  end

  def meal_params
    params.require(:meal).permit(:time_period, :meal_quantity)
  end
end
