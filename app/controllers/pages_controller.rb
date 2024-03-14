class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home]

  def home
  end

  def find_buddies
    @match = Match.new
    interests = current_user.interests if current_user

    if params[:distance].present?
      @users = []
      @nearby_users = User.near([current_user.latitude, current_user.longitude], params[:distance].to_i)
      @nearby_users.each do |user|
        interests.each do |interest|
          @users << user if user.interests.include?(interest)
        end
      end
    else
      @users = User.joins(:interests).where(interests: { id: interests }).where.not(id: current_user.id).distinct
    end

    @users = @users.filter { |user| !user.matched?(current_user) }
    @user_interests = UserInterest.where(user_id: current_user)
  end

  def profile
    @user = current_user
    @user_interests = UserInterest.where(user_id: current_user)
  end

  def show
    @user = User.find(params[:id])
    @user_interests = UserInterest.where(user_id: current_user)

  end

  def dashboard
    @user = current_user
    @user_interests = UserInterest.where(user_id: current_user)
  end

end
