# frozen_string_literal: true

module ApplicationHelper
  def title(page_title)
    # binding.pry
    content_for(:title) { page_title }
  end

  def site_name
    content_for(:site_name) { 'Portfolio Project' }
  end
end
