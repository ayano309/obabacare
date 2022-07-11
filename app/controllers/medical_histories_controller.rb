class MedicalHistoriesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_medical_history, only: %i[edit update]

  def new
    @medical_history = current_user.medical_histories.build
  end

  def create
    @medical_history = current_user.medical_histories.build(medical_history_params)
    if @medical_history.save
      redirect_to profile_path, notice: '保存できました'
    else
      flash.now[:error] = '保存に失敗しました'
      render :new
    end
  end

  def edit; end

  def update
    if @medical_history.update(medical_history_params)
      redirect_to profile_path, notice: '更新できました'
    else
      flash.now[:error] = '更新できませんでした'
      render :edit
    end
  end

  def destroy
    medical_history = current_user.medical_histories.find(params[:id])
    medical_history.destroy!
    redirect_to profile_path, notice: '削除に成功しました'
  end

  private
  def medical_history_params
    params.require(:medical_history).permit(:disease_name,:in_treatment,:when_onset)
  end

  def set_medical_history
    @medical_history = current_user.medical_histories.find(params[:id])
  end
end
