class UserInterestsController < ApplicationController
  def new
    @interests = Interest.all
    @user_interest = UserInterest.new
  end

  def create
    interests = params[:user_interest][:interest_id]
    interests.each do |interest_id|
      new_interest = UserInterest.new(interest_id:, user: current_user)
      new_interest.save!
    end
  end
end


class UserInterestsController < ApplicationController
  def new
    @interests = Interest.all
    @user_interest = UserInterest.new
  end

  def create
    interests = params[:user_interest][:interest]
    interests.each do |interest_id|
      new_interest = UserInterest.new(interest_id:, user: current_user)
      new_interest.save!
    end
  end
end
