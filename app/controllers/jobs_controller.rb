class JobsController < ApplicationController
  before_action :set_job, except: %i[index new create]
  before_action :authenticate_business!, except: %i[index show]
  before_action :redirect_business_job, only: %i[edit update destroy close open]

  helper_method :business_job?

  def index
    @jobs = Job.open
    @business_jobs = Job.where business: current_business
  end

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
    @job.update closed: true
    flash[:notice] = 'Job was successfully closed.'
    redirect_to @job
  end

  def open
    @job.update closed: false
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
    params.require(:job).permit(:position, :description)
  end
end
