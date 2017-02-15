# frozen_string_literal: true
require 'spec_helper'

describe 'layouts/application' do
  it 'has the correct <title> element ' do
    title = 'Your Accomplishments | Portfolio Project'
    view.content_for(:title) { title }
    render
    expect(rendered).to have_content title
  end
end

