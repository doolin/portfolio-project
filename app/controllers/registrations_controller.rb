# frozen_string_literal: true
class RegistrationsController < Devise::RegistrationsController
  protected

  def after_sign_up_path_for(_resource)
    # binding.pry
    new_profile_path
  end
end
