module ApplicationsHelper
  def personal_color
    'green' if @application.personaled?
  end

  def cover_color
    'green' if @application.covered?
  end

  def screening_color
    return unless @application.covered?
    if @application.screened?
      'green'
    else
      @application.rejected? ? 'red' : 'yellow'
    end
  end

  def interview_color
    return unless @application.screened?
    if @application.interviewed?
      'green'
    else
      @application.rejected? ? 'green' : 'yellow'
    end
  end

  def accepted_color
    if @application.accepted?
      'green'
    elsif @application.screened? && @application.rejected?
      'red'
    end
  end
end
