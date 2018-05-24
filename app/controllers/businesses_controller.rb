class BusinessesController < ApplicationController
  before_action :authenticate_recruiter!, except: [:show]

  def index; end

  def new
    redirect_to_old_business
    @business = Business.new
  end

  def create
    redirect_to_old_business
    business = Business.new business_params
    current_recruiter.assign_business business
    business.save
    redirect_to business
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
    recruiter = current_recruiter
    old_business = recruiter.business
    redirect_to old_business if old_business
  end
end
