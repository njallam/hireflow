class ApplicationsController < ApplicationController
  def create
    application = Application.new
    application.applicant = current_applicant
    application.job = Job.find params[:id]
    if application.save
      redirect_to application
    else
      redirect_to application.find_existing
    end
  end

  def show
    @application = Application.find params[:id]
  end
end
