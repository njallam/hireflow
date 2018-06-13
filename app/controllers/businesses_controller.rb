class BusinessesController < ApplicationController
  before_action :authenticate_business!, only: %i[edit update]

  def edit
    @business = current_business
  end

  def update
    @business = current_business
    if @business.update business_params
      attach_logo
      flash[:notice] = 'Changes Saved'
      redirect_to edit_business_profile_path
    else
      render 'edit'
    end
  end

  private

  def business_params
    params.require(:business).permit(:name, :city, :size, :description)
  end

  def attach_logo
    logo = params[:business][:logo]
    @business.logo.attach logo if logo
  end
end
