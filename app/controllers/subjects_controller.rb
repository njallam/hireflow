class SubjectsController < ApplicationController
  before_action :set_education, only: %i[new create edit update destroy]
  before_action :set_subject, only: %i[edit update destroy]
  before_action :authenticate_applicant!
  before_action :subject_authenticate, only: %i[edit update destroy]

  def new
    @subject = Subject.new
  end

  def edit; end

  def create
    @subject = Subject.new(subject_params)
    @subject.education = @education

    if @subject.save
      redirect_to edit_applicant_profile_path, notice: 'Subject was successfully created.'
    else
      render :new
    end
  end

  def update
    if @subject.update(subject_params)
      redirect_to edit_applicant_profile_path, notice: 'Subject was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @subject.destroy
    redirect_to edit_applicant_profile_path, notice: 'Subject was successfully destroyed.'
  end

  private

  # Use callbacks to share common setup or constraints between actions.

  def set_education
    @education = Education.find(params[:education_id])
  end

  def set_subject
    @subject = Subject.find(params[:id])
  end

  # Only allow a trusted parameter "white list" through.
  def subject_params
    params.require(:subject).permit(:title, :result)
  end

  def subject_authenticate
    @subject.education == @education && @education.applicant == current_applicant
  end
end
