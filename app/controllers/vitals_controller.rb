class VitalsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_vital, only: %i[show edit update]
  def index
    @vitals = Vital.where(user_id: current_user.id)
  end

  def show; end

  def new
    @vital = current_user.vitals.build
  end

  def create
    @vital = current_user.vitals.build(vital_params)
    if @vital.save
      redirect_to vital_path(@vital), notice: '保存できました'
    else
      flash.now[:error] = '保存に失敗しました'
      render :new
    end
  end

  def edit; end

  def update
    if @vital.update(vital_params)
      redirect_to vital_path(@vital), notice: '更新できました'
    else
      flash.now[:error] = '更新できませんでした'
      render :edit
    end
  end

  def destroy
    vital = current_user.vitals.find(params[:id])
    vital.destroy!
    redirect_to vitals_path, notice: '削除に成功しました'

  end

  private
  def vital_params
    params.require(:vital).permit(:breathing,:high_bp,:low_bp,:pulse,
                                  :temperature,:moisture_supply,:oxygen_saturation,:day)
  end

  def set_vital
    @vital = current_user.vitals.find(params[:id])
  end
end
