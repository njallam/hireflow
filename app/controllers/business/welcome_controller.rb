class Business::WelcomeController < Business::ApplicationController
  def index; end

  def edit; end

  def update
    if @business.update business_params
      flash[:notice] = 'Changes Saved'
      redirect_to business_profile_path
    else
      render 'edit'
    end
  end

  private

  def business_params
    params.require(:business).permit(:name)
  end
end
