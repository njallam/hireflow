class ApplicationsController < ApplicationController
  def create
    application = Application.new
    application.applicant = current_applicant
    application.job = Job.find params[:id]
    if application.save
      redirect_to application
    else
      redirect_to Application.find_by applicant: application.applicant, job: application.job
    end
  end

  def show
    @application = Application.find params[:id]
  end
end
