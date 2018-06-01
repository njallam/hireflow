module JobsHelper
  def business_job?(job)
    job.business == current_business
  end
end
