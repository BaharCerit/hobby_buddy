class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home]

  def home
  end

  def find_buddies
    @match = Match.new
    interests = current_user.interests if current_user
    @users = User.joins(:interests).where(interests: { id: interests }).where.not(id: current_user.id).distinct
    @users = @users.filter{|user| !user.matched?(current_user)}
    @user_interests = UserInterest.where(user_id: current_user)


    if params[:distance]
      @users = @users.near([current_user.latitude, current_user.longitude], params[:distance].to_i)


    end
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
