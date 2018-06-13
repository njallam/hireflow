module ApplicationsHelper
  def personal_color(application)
    application.personaled? ? 'green' : 'yellow'
  end

  def cover_color(application)
    'green' if application.covered?
  end

  def screening_color(application)
    return unless application.covered?
    if application.screened?
      'green'
    else
      application.rejected? ? 'red' : 'yellow'
    end
  end

  def interview_color(application)
    return unless application.screened?
    if application.interviewed?
      'green'
    else
      application.rejected? ? 'green' : 'yellow'
    end
  end

  def accepted_color(application)
    if application.accepted?
      'green'
    elsif application.screened? && application.rejected?
      'red'
    end
  end
end
