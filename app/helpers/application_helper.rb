module ApplicationHelper
  def business_controller?
    params[:controller].starts_with? 'business/'
  end

  def applicant_controller?
    params[:controller].starts_with? 'applicant/'
  end
end
