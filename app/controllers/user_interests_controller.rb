class UserInterestsController < ApplicationController
  def new
    @interests = Interest.all
    @user_interest = UserInterest.new
  end

  def create
    # @interests = Interest.all
    current_user.user_interests.destroy_all

    interest_ids = params[:user_interest][:interest]
    interest_ids.each do |interest_id|
      new_interest = UserInterest.new(interest_id: interest_id, user: current_user)
      new_interest.save!
    end

    redirect_to profile_path
  end
end

