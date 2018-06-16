class JobsController < ApplicationController
  before_action :set_job, except: %i[index new create]
  before_action :authenticate_business!, except: %i[index show]
  before_action :redirect_business_job, only: %i[edit update destroy close open]

  helper_method :business_job?

  # This method smells of :reek:TooManyStatements :reek:NilCheck
  # rubocop:disable Metrics/AbcSize
  def index
    position = params[:position]
    salary = params[:salary]
    starting = params[:starting]
    ending = params[:ending]
    jobs_scope = Job.open
    jobs_scope = jobs_scope.position(position) if position.present?
    jobs_scope = jobs_scope.salary(salary) if salary&.to_i&.positive?
    jobs_scope = jobs_scope.starting(starting) if starting.present?
    jobs_scope = jobs_scope.ending(ending) if ending.present?
    @jobs = smart_listing_create :jobs, jobs_scope, partial: 'jobs/list'
    # @business_jobs = Job.where business: current_business
  end
  # rubocop:enable Metrics/AbcSize

  def show
    @application = Application.find_by job: @job, applicant: current_applicant
  end

  def new
    @job = Job.new
  end

  def edit; end

  def create
    @job = Job.new job_params
    @job.business = current_business

    if @job.save
      flash[:notice] = 'Job was successfully created.'
      redirect_to job_path(@job)
    else
      render :new
    end
  end

  def update
    if @job.update job_params
      flash[:notice] = 'Job was successfully updated.'
      redirect_to job_path @job
    else
      render :edit
    end
  end

  def destroy
    @job.destroy
    flash[:notice] = 'Job was successfully destroyed.'
    redirect_to jobs_path
  end

  def close
    @job.update deadline: Time.zone.now
    flash[:notice] = 'Job was successfully closed.'
    redirect_to @job
  end

  def open
    @job.update deadline: nil
    flash[:notice] = 'Job was successfully opened.'
    redirect_to @job
  end

  private

  def set_job
    @job = Job.find params[:id]
  end

  def business_job?(job)
    job.business == current_business
  end

  def redirect_business_job
    redirect_to jobs_path unless business_job? @job
  end

  def job_params
    params.require(:job).permit(:position, :description, :salary, :start_date, :end_date, :deadline,
                                :questions)
  end
end
