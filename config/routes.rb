PortfolioProject::Application.routes.draw do

  # The priority is based upon order of creation:
  # first created -> highest priority.


  # All non-logged in users go to sales page.
  root :to => "sales#index"

  match '/contact',            :to => 'pages#contact'
  match '/about',              :to => 'pages#about'
  match '/faq',                :to => 'pages#faq'
  match '/terms',              :to => 'pages#terms'
  match '/disclaimer',         :to => 'pages#disclaimer'
  match '/disclosure',         :to => 'pages#disclosure'
  match '/confirmation',       :to => 'pages#confirmation'
  match '/newsletter',         :to => 'pages#newsletter'
  match '/privacy',            :to => 'pages#privacy'
  match '/help',               :to => 'pages#help'
  match '/thank-you',          :to => 'pages#thank-you'
  match '/already-subscribed', :to => 'pages#already-subscribed'

  match '/advertising',        :to => 'sales#advertising'

  # Having a problem dealing with a form in Capybara.
  # Might test this in rspec instead.
  #match '/scripts/addlead.pl',:to => 'pages#thank-you'

  devise_for :members, :controllers => { :registrations => "registrations" }

  # Needs a controller...
  resources :members

  # After the user is authenticated, reroute
  # to his or her profile.
  # But this isn't working in Cucumber...
#=begin
  namespace :member do
    root :to => 'members#show'
  end
#=end
  #match 'members/:id' => 'members#show', :as => 'member_root'
  #match '/members/:id', :to => redirect {|params| "/#{params[:membername]}" }

  resources :profiles
  resources :projects

  resources :sitemaps, :only => :index
  #match '/sitemap', :to => '/sitemap.xml', :controller => 'sitemaps'
end
