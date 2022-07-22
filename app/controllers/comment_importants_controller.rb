class CommentImportantsController < ApplicationController
  before_action :authenticate_user!
  def index
    @vitals = Vital.eager_load(:comments).vitals_month(current_user)
    
    vital_ids = current_user.vitals.vital_defecations_days.pluck(:id)
    @defecations = current_user.defecations.where(vital_id: vital_ids)
  end
end
