class BusinessesController < ApplicationController
  before_action :authenticate_business!, only: %i[edit update]

  def edit
    @business = current_business
  end

  def update
    @business = current_business
    if @business.update business_params
      flash[:notice] = 'Changes Saved'
      redirect_to edit_business_profile_path
    else
      render 'edit'
    end
  end

  private

  def business_params
    params.require(:business).permit(:name)
  end

end
