class ApplicantsController < ApplicationController
  before_action :authenticate_applicant!

  def index; end
end
