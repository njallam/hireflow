class ExperiencesController < ApplicationController
  before_action :set_experience, only: %i[edit update destroy]
  before_action :authenticate_applicant!
  before_action :experience_authenticate, only: %i[edit update destroy]

  def new
    @experience = Experience.new
  end

  def edit; end

  def create
    @experience = Experience.new(experience_params)
    @experience.applicant = current_applicant

    if @experience.save
      redirect_to edit_applicant_profile_path, notice: 'Experience was successfully created.'
    else
      render :new
    end
  end

  def update
    if @experience.update(experience_params)
      redirect_to edit_applicant_profile_path, notice: 'Experience was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @experience.destroy
    redirect_to edit_applicant_profile_path, notice: 'Experience was successfully destroyed.'
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_experience
    @experience = Experience.find(params[:id])
  end

  # Only allow a trusted parameter "white list" through.
  def experience_params
    params.require(:experience).permit(:place, :title, :description, :start_date, :end_date)
  end

  def experience_authenticate
    @experience.applicant == current_applicant
  end
end
