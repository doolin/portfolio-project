# frozen_string_literal: true

class SalesController < ApplicationController
  def index
    if member_signed_in?
      redirect_to current_member
    else
      @projects = Project.all
      @profiles = Profile.all
    end
  end

  # Add more pages as necessary, but only when necessary.
end
