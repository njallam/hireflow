class ApplicationsController < ApplicationController
  before_action :set_application, only: %i[show confirm update]
  before_action :redirect_application, only: %i[show confirm update]
  before_action :authenticate_applicant!, only: %i[show index create confirm update]

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

  def confirm
    @application.confirm!
    redirect_to @application
  end

  def update
    if @application.cover?
      @application.update params.require(:application).permit(:cover_letter)
      flash[:notice] = 'Cover letter saved.'
      @application.submit! if params[:commit] == 'Submit'
      redirect_to @application
    end
  end

  def show
  end

  private

  def set_application
    @application= Application.find params[:id]
  end

  def redirect_application
    # TODO
  end

end
