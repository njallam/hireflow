class WelcomeController < ApplicationController
  def index; end

  def new; end

  def edit
    redirect_to root_path unless business_signed_in? # FIXME
    @business = current_business
  end

  def update
    redirect_to root_path unless business_signed_in? # FIXME
    @business = current_business
    if @business.update business_params
      flash[:notice] = 'Changes Saved'
      redirect_to profile_path
    else
      render 'edit'
    end
  end

  private

  def business_params
    params.require(:business).permit(:name)
  end
end
