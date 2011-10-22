class SitemapsController < ApplicationController
  respond_to :xml
  caches_page :show

  def index
    @projects = Project.all
    @profiles = Profile.all
    #@other_posts = OtherPosts.all
    @other_routes = ["/","/contact","/terms"]
    respond_to do |format|
      format.xml
    end
  end
end
