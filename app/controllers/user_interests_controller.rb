class UserInterestsController < ApplicationController
  def show
    @user = User.find(params[:user_id])
  end

  def new
    @interests = Interest.all
    @user_interest = UserInterest.new
  end

  def create
    # @interests = Interest.all
    current_user.user_interests.destroy_all

    if params[:user_interest].blank?
      flash[:alert] = "Please select at least one interest."
      redirect_to new_user_interest_path
      return
    end
    interest_ids = params[:user_interest][:interest]



    interest_ids.each do |interest_id|
      new_interest = UserInterest.new(interest_id: interest_id, user: current_user)
      new_interest.save!
    end

    redirect_to profile_path
  end
end
