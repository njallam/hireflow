class ApplicationsController < ApplicationController
  before_action :authenticate_applicant!, only: %i[index create]

  def index
    @applications = current_applicant.applications
  end

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
    # TODO: authenticate
    @application = Application.find params[:id]
  end
end
