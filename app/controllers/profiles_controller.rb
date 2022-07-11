class ProfilesController < ApplicationController
  before_action :authenticate_user!

  def show
    @profile = current_user.profile
    @current_medical_history = current_user.medical_histories.where(in_treatment: 'true')
    @medical_histories = current_user.medical_histories.where(in_treatment: 'false')
  end

  def edit
    @profile = current_user.prepare_profile
  end
  
  def update
    @profile = current_user.prepare_profile
    @profile.assign_attributes(profile_params)
    
    if @profile.save
      redirect_to profile_path, notice: 'プロフィール更新しました'
    else
      flash.now[:error] = '更新できませんでした'
      render :edit
    end
  end

  private
  def profile_params
    params.require(:profile).permit(
      :blood_type,
      :important_term,
      :gender,
      :birthday,
      :weight 
    )
  end
end