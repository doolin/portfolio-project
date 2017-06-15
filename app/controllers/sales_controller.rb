# frozen_string_literal: true
class SalesController < ApplicationController
  def index
    if member_signed_in?
      redirect_to current_member
    else
      @info = 'Some information'
      @featured_profiles = featured_profiles
      @projects = Project.all
      @profiles = Profile.all
    end
  end

  private

  def featured_profiles
    puts "IN FEATURED PROFILES"
    profiles = %w{ featured1 featured2 featured3 featured4 }
    result = profiles.map { |p| Profile.find(PROFILES[p]) }
    result
  end
end
