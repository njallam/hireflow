class Business::ApplicationController < ApplicationController
  before_action :authenticate_business!
end
