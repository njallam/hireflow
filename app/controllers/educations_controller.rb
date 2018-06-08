class EducationsController < ApplicationController
  before_action :set_education, only: %i[edit update destroy]
  before_action :authenticate_applicant!
  before_action :education_authenticate, only: %i[edit update destroy]

  def new
    @education = Education.new
  end

  def edit; end

  def create
    @education = Education.new(education_params)
    @education.applicant = current_applicant

    if @education.save
      redirect_to edit_applicant_profile_path, notice: 'Education was successfully created.'
    else
      render :new
    end
  end

  def update
    if @education.update(education_params)
      redirect_to edit_applicant_profile_path, notice: 'Education was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @education.destroy
    redirect_to edit_applicant_profile_path, notice: 'Education was successfully destroyed.'
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_education
    @education = Education.find(params[:id])
  end

  # Only allow a trusted parameter "white list" through.
  def education_params
    params.require(:education).permit(:place, :start_date, :end_date)
  end

  def education_authenticate
    @education.applicant == current_applicant
  end
end
