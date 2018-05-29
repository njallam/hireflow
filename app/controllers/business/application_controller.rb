class Business::ApplicationController < ApplicationController
  before_action :authenticate_business!
  before_action { @business = current_business }
end
