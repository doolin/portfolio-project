# Set the host name for URL creation
SitemapGenerator::Sitemap.default_host = "http://portfolio-project.com"
SitemapGenerator::Sitemap.sitemaps_host = "http://s3.amazonaws.com/inventium-sitemap/"
SitemapGenerator::Sitemap.public_path = 'tmp/'
SitemapGenerator::Sitemap.sitemaps_path = 'tmp/'
#SitemapGenerator::Sitemap.sitemaps_path = 'sitemaps/'
#SitemapGenerator::Sitemap.yahoo_app_id = "my_app_id"
SitemapGenerator::Sitemap.adapter = SitemapGenerator::WaveAdapter.new
SitemapGenerator::Sitemap.create do

  Project.find_each do |project|
    add project_path(project), :lastmod => project.updated_at
  end

  Profile.find_each do |profile|
    add profile_path(profile), :lastmod => profile.updated_at
  end

  add '/about'
  add '/disclaimer'
  add '/disclosure'
  add '/faq'
  add '/help'
  add '/privacy'
  add '/terms'

end
