
base_url = "http://#{request.host_with_port}"
xml.instruct! :xml, :version=>'1.0'

xml.tag! 'urlset', 'xmlns' => 'http://www.sitemaps.org/schemas/sitemap/0.9' do

  @other_routes.each do |other|
    xml.url {
      xml.loc("http://www.mysite.com#{other}")
      xml.changefreq("daily")
    }
  end
  
  @projects.each do |project|
    xml.url {
      xml.loc("http://www.mysite.com/posts/#{project.name.to_s}")
      xml.changefreq("daily")
    }
  end

  @profiles.each do |profile|
    xml.url {
      xml.loc("http://www.mysite.com/profiles/#{profile.url.to_s}")
      xml.changefreq("daily")
    }
  end

=begin
  @other_posts.each do |other_post|
    xml.url {
      xml.loc("http://www.mysite.com/other_posts/#{other_post.name.to_s}")
      xml.changefreq("daily")
    }
  end
=end

end
