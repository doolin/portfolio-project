# frozen_string_literal: true

class PagesController < ApplicationController
  def contact
    @site_name = 'Portfolio project'
    @title = 'Contact'
  end

  def disclosure; end

  def confirmation; end

  def terms
    @site_name = 'Portfolio Project'
  end

  def about
    @site_name = 'Portfolio Project'
    @title = 'About'
  end

  def privacy
    @site_name = 'Portfolio Project'
  end

  def disclaimer
    @site_name = 'Portfolio Project'
  end

  def help
    @site_name = 'Portfolio Project'
  end
end
