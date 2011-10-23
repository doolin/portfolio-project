
base_url = "http://#{request.host_with_port}"
xml.instruct! :xml, :version=>'1.0'

xml.tag! 'urlset', 'xmlns' => 'http://www.sitemaps.org/schemas/sitemap/0.9' do

  @root_routes.each do |other|
    xml.url {
      xml.loc("#{base_url}#{other}")
      xml.lastmod(Time.now.strftime("%Y-%m-%d"))
      xml.changefreq("daily")
      xml.priority("1.0")
    }
  end
  
  @other_routes.each do |other|
    xml.url {
      xml.loc("#{base_url}#{other}")
      xml.lastmod(Time.now.strftime("%Y-%m-%d"))
      xml.changefreq("monthly")
      xml.priority("0.2")
    }
  end

  @projects.each do |project|
    xml.url {
      xml.loc("#{base_url}/projects/#{project.url.to_s}")
      xml.lastmod(project.updated_at)
      xml.changefreq("weekly")
      xml.priority("0.7")
    }
  end

  @profiles.each do |profile|
    xml.url {
      xml.loc("#{base_url}/profiles/#{profile.url.to_s}")
      xml.lastmod(profile.updated_at)
      xml.changefreq("weekly")
      xml.priority("0.7")
    }
  end

end
