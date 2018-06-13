class ApplicationsController < ApplicationController
  before_action :set_application, except: %i[index create]
  before_action :authenticate_applicant!, only: :create
  before_action :authenticate_viewer, except: :create

  def index
    @applications = if applicant_signed_in? then current_applicant.applications
                    else current_business.applications
                    end
    @action = @applications.action(applicant_signed_in?)
    @waiting = @applications.waiting(applicant_signed_in?)
    @completed = @applications.completed
  end

  def create
    application = Application.new_application current_applicant, Job.find(params[:id])
    if application.save then redirect_to application
    else redirect_to application.job, alert: application.errors
    end
  end

  def confirm
    @application.confirm! applicant_signed_in?
    redirect_to @application
  end

  # This method smells of :reek:TooManyStatements
  def update
    if @application.cover? then save_element :cover_letter, 'Cover letter saved'
    elsif @application.screening?
      save_element :interview_message, 'Interview message saved'
      @application.accept! applicant_signed_in?
    elsif @application.offer? then save_element :offer, 'Offer saved'
    end
    # TODO: limit which type of user can do what
    @application.submit! applicant_signed_in? if params[:commit] == 'Submit'
    redirect_to @application
  end

  def accept
    @application.accept! applicant_signed_in?
    redirect_to @application
  end

  def reject
    @application.reject!
    redirect_to @application
  end

  def show; end

  private

  def save_element(param, message)
    @application.update params.require(:application).permit(param)
    flash[:notice] = message
  end

  def authenticate_viewer
    if applicant_signed_in? then redirect_applicant if @application
    elsif business_signed_in? then redirect_business if @application
    else redirect_to root_url, alert: 'You must be signed in to view an application.'
    end
  end

  def set_application
    @application = Application.find params[:id]
  end

  def redirect_applicant
    redirect_to applications_path unless @application.applicant == current_applicant
  end

  def redirect_business
    redirect_to applications_path unless @application.job.business == current_business
  end
end
