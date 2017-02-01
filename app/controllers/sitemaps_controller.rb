# frozen_string_literal: true
class SitemapsController < ApplicationController
  respond_to :xml
  caches_page :show

  def index
    @projects = Project.all
    @profiles = Profile.all
    # @other_posts = OtherPosts.all
    @other_routes = ['/contact', '/terms', '/privacy', '/about']
    @root_routes = ['/', '/projects', '/profiles']
    respond_to do |format|
      format.xml
    end
  end
end
