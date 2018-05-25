class BusinessesController < ApplicationController
  before_action :authenticate_recruiter!, except: [:show]

  def index; end

  def new
    redirect_to_old_business
    @business = Business.new
  end

  def create
    redirect_to_old_business
    @business = Business.new business_params
    if @business.save
      current_recruiter.update business: @business
      redirect_to @business
    else
      render 'new'
    end
  end

  def edit
    @business = Business.find(params[:id])
    redirect_to @business unless current_recruiter.business == @business
  end

  def show
    @business = Business.find(params[:id])
  end

  private

  def business_params
    params.require(:business).permit(:name, :bio)
  end

  def redirect_to_old_business
    old_business = current_recruiter.business
    redirect_to old_business if old_business
  end
end
