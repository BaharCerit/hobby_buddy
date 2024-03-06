class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]

  def home
  end

  def find_buddies
    interests = current_user.interests if current_user
    @users = User.joins(:interests).where(interests: { id: interests }).where.not(id: current_user.id).distinct
  end
end
