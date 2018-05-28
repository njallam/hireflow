class Applicant::ApplicationController < ApplicationController
  before_action :authenticate_applicant!
end
