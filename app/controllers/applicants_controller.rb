class ApplicantsController < ApplicationController
  before_action :authenticate_applicant!, only: %i[edit update]

  def edit
    @applicant = current_applicant
  end

  def update
    @applicant = current_applicant
    if @applicant.update applicant_params
      flash[:notice] = 'Changes Saved'
      redirect_to edit_applicant_profile_path
    else
      render 'edit'
    end
  end

  private

  def applicant_params
    params.require(:applicant).permit(:first_name, :last_name, :university)
  end
end
