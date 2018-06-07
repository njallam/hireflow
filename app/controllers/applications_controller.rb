class ApplicationsController < ApplicationController
  before_action :set_application, only: %i[show confirm update accept reject]
  before_action :authenticate_viewer, only: %i[show update reject]
  before_action :authenticate_viewer!, only: :index
  before_action :authenticate_applicant!, only: %i[create confirm]
  before_action :authenticate_business!, only: :accept
  before_action :redirect_applicant, only: :confirm
  before_action :redirect_business, only: :accept

  def index
    @applications = if applicant_signed_in?
                      current_applicant.applications
                    else
                      current_business.applications
                    end
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
    @application.update params.require(:application).permit(:cover_letter)
    @application.submit! if params[:commit] == 'Submit'
    if @application.cover?
      flash[:notice] = 'Cover letter saved.'
    elsif @application.offer?
      flash[:notice] = 'Offer saved.'
    end
    redirect_to @application
  end

  def accept
    @application.accept!
    redirect_to @application
  end

  def reject
    @application.reject!
    redirect_to @application
  end

  def show; end

  private

  def authenticate_viewer
    if applicant_signed_in?
      redirect_applicant
    elsif business_signed_in?
      redirect_business
    else
      redirect_to root_url, alert: 'You must be signed in to view an application.'
    end
  end

  def authenticate_viewer!
    redirect_to root_url, alert: 'You must be signed in to view an application.' unless
      applicant_signed_in? || business_signed_in?
  end

  def set_application
    @application = Application.find params[:id]
  end

  def redirect_applicant
    redirect_to applications_path unless @application.applicant == current_applicant
  end

  def redirect_business
    redirect_to jobs_path unless @application.job.business == current_business
  end
end
