# frozen_string_literal: true

base_url = "http://#{request.host_with_port}"
xml.instruct! :xml, version: '1.0'

xml.tag! 'urlset', 'xmlns' => 'http://www.sitemaps.org/schemas/sitemap/0.9' do
  @root_routes.each do |other|
    xml.url do
      xml.loc("#{base_url}#{other}")
      xml.lastmod(Time.now.strftime('%Y-%m-%d'))
      xml.changefreq('daily')
      xml.priority('1.0')
    end
  end

  @other_routes.each do |other|
    xml.url do
      xml.loc("#{base_url}#{other}")
      xml.lastmod(Time.now.strftime('%Y-%m-%d'))
      xml.changefreq('monthly')
      xml.priority('0.2')
    end
  end

  @projects.each do |project|
    xml.url do
      xml.loc("#{base_url}/projects/#{project.url}")
      xml.lastmod(project.updated_at.strftime('%Y-%m-%d'))
      xml.changefreq('weekly')
      xml.priority('0.7')
    end
  end

  @profiles.each do |profile|
    xml.url do
      xml.loc("#{base_url}/profiles/#{profile.url}")
      xml.lastmod(profile.updated_at.strftime('%Y-%m-%d'))
      xml.changefreq('weekly')
      xml.priority('0.7')
    end
  end
end
