class RegistrationsController < Devise::RegistrationsController
  def create
    build_resource(sign_up_params)

    resource.save
    yield resource if block_given?
    if resource.persisted?
      if resource.active_for_authentication?
        set_flash_message! :notice, :signed_up
        sign_up(resource_name, resource)
        redirect_to profile_path
      else
        set_flash_message! :notice, :"signed_up_but_#{resource.inactive_message}"
        expire_data_after_sign_in!
        redirect_to profile_path
      end
    else
      clean_up_passwords resource
      set_minimum_password_length
      respond_with resource
    end
  end

  def after_update_path_for(resource)
    # profile_path
    dashboard_path
    # redirect_to controller: 'pages', action: 'dashboard'
  end

  def update_resource(resource, params)
    resource.update_without_password(params)
    # redirect_to controller: 'pages', action: 'dashboard'
  end

  # DELETE /resource
  # def destroy
  #   @user = User.find(params[:id])
  #   @first_matches = Matches.find_by(first_user_id: params[:id])
  #   @first_matches.destroy


  #   @second_matches = Matches.find_by(second_user_id: params[:id])
  #   @second_matches.destroy

  #   @user.destroy
  #   if @user.destroy
  #     redirect_to root_url, notice: "User deleted"
  #   end

  # end

end
