class Business::JobsController < Business::ApplicationController
  before_action :set_job, only: %i[show edit update destroy]

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
      redirect_to business_job_path(@job), notice: 'Job was successfully created.'
    else
      render :new
    end
  end

  def update
    if @job.update(job_params)
      redirect_to business_job_path(@job), notice: 'Job was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @job.destroy
    redirect_to business_jobs_path, notice: 'Job was successfully destroyed.'
  end

  private

  def set_job
    @job = Job.find(params[:id])
  end

  def job_params
    params.require(:job).permit(:position, :description)
  end
end
