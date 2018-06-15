module ApplicationsHelper
  def personal_color(application)
    application.personaled? ? 'green' : 'yellow'
  end

  def cover_color(application)
    (application.covered? ? 'green' : 'yellow') if application.personaled?
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
    return unless application.interviewed?
    if application.accepted?
      'green'
    elsif application.screened? && application.rejected?
      'red'
    else
      'yellow'
    end
  end
end
