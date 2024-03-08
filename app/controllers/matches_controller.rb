class MatchesController < ApplicationController
  def create
    @form_type = params[:match][:form]
    @profile_id = params[:match][:profile]

    if @form_type == "like"
      Match.create(first_user_id: current_user.id, second_user_id: @profile_id, status: "accepted")
    else
      Match.create(first_user_id: current_user.id, second_user_id: @profile_id, status: "rejected")
    end

    respond_to do |format|
      format.html
      format.text { render partial: "match_success", formats: [:html] }
    end
    # @form_type == "like" ? swipe_right(@profile_id) : swipe_left(@profile_id)
  end

  def swipe_left(profile_id)
    if user_has_swiped(profile_id).nil?
      Match.create(
        first_user_id: current_user.profile.id,
        second_user_id: profile_id,
        status: 'rejected'
      )
    else
      @match.rejected!
      @match.save!
    end
  end

  def swipe_right(profile_id)
    user_has_swiped(profile_id).nil? ? handle_initial_swipe_right(profile_id) : handle_its_a_match
    @match.save!
    respond_to do |format|
      # profile = Profile.find(profile_id)
      # msg = { status: @match.status, profile: profile.user_name, match_id: @match.id }
      # format.json { render json: msg }
      format.text { "hello" }
    end
  end

  private

  def handle_initial_swipe_right(profile_id)
    @match = Match.new(
      first_user_id: current_user.profile.id,
      second_user_id: profile_id,
      status: 'pending'
    )
  end

  def handle_its_a_match
    @match.accepted! unless @match.rejected?
  end

  def user_matches
    Match.where(first_user_id: @test_profile.user_id)
  end

  def user_has_swiped(profile_id)
    @match = Match.where(
      'first_user_id = ? AND second_user_id = ?',
      profile_id, current_user.profile.id
    ).first
  end
end
