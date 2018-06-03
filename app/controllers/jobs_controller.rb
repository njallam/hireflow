class JobsController < ApplicationController
  before_action :set_job, only: %i[show edit update destroy]
  before_action :redirect_business_job, only: %i[new create edit update destroy] # FIXME

  helper_method :business_job?

  def index
    @jobs = Job.all
  end

  def show; end

  def new
    @job = Job.new
  end

  def edit; end

  def create
    @job = Job.new job_params
    @job.business = @business

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

  private

  def set_job
    @job = Job.find params[:id]
  end

  def business_job?(job)
    job.business == current_business
  end

  def redirect_business_job
    authenticate_business!
    redirect_to jobs_path unless business_job? @job
  end

  def job_params
    params.require(:job).permit(:position, :description)
  end
end
