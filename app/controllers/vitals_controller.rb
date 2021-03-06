class VitalsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_vital, only: %i[show edit update]
  before_action :set_user, only: %i[index new create]
  def index
    if params[:keyword].present?
      @keyword = params[:keyword].strip
      @vitals = Vital.search_information(@keyword).on_vitals(@user, params[:page])
    else
      @keyword = ''
      @vitals = Vital.eager_load(:meals).on_vitals(@user, params[:page])
    end
    #便秘機能
    vital_ids = current_user.vitals.vital_defecations_days.pluck(:id)
    @defecations = current_user.defecations.where(vital_id: vital_ids)
  end

  def show
    @comment = Comment.new
    @comments = @vital.comments
  end

  def new
    @vital = @user.vitals.build
  end

  def create
    @vital = @user.vitals.build(vital_params)
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

  def set_user
    @user = current_user
  end
end
