class JobsController < ApplicationController
  before_action :set_job, only: %i[show edit update destroy]
  before_action :redirect_business_job, only: %i[new create edit update destroy]

  def index
    @jobs = Job.all
  end

  def show; end

  def new
    @job = Job.new
  end

  def edit; end

  def create
    @job = Job.new(job_params)
    @job.business = @business

    if @job.save
      redirect_to job_path(@job), notice: 'Job was successfully created.'
    else
      render :new
    end
  end

  def update
    if @job.update(job_params)
      redirect_to job_path(@job), notice: 'Job was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @job.destroy
    redirect_to jobs_path, notice: 'Job was successfully destroyed.'
  end

  private

  def set_job
    @job = Job.find(params[:id])
  end

  def redirect_business_job
    authenticate_business!
    redirect_to jobs_path unless business_job?
  end

  def job_params
    params.require(:job).permit(:position, :description)
  end
end
