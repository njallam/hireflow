class AchievementsController < ApplicationController
  before_action :set_achievement, only: %i[edit update destroy]
  before_action :authenticate_applicant!
  before_action :achievement_authenticate, only: %i[edit update destroy]

  def new
    @achievement = Achievement.new
  end

  def edit; end

  def create
    @achievement = Achievement.new(achievement_params)
    @achievement.applicant = current_applicant

    if @achievement.save
      redirect_to edit_applicant_profile_path, notice: 'Achievement was successfully created.'
    else
      render :new
    end
  end

  def update
    if @achievement.update(achievement_params)
      redirect_to edit_applicant_profile_path, notice: 'Achievement was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @achievement.destroy
    redirect_to edit_applicant_profile_path, notice: 'Achievement was successfully destroyed.'
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_achievement
    @achievement = Achievement.find(params[:id])
  end

  # Only allow a trusted parameter "white list" through.
  def achievement_params
    params.require(:achievement).permit(:title, :description, :date)
  end

  def achievement_authenticate
    @achievement.applicant == current_applicant
  end
end
