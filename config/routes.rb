PortfolioProject::Application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  # The priority is based upon order of creation:
  # first created -> highest priority.

  # All non-logged in users go to sales page.
  root to: 'sales#index'

  get '/contact',            to: 'pages#contact'
  get '/about',              to: 'pages#about'
  get '/faq',                to: 'pages#faq'
  get '/terms',              to: 'pages#terms'
  get '/disclaimer',         to: 'pages#disclaimer'
  get '/disclosure',         to: 'pages#disclosure'
  get '/confirmation',       to: 'pages#confirmation'
  get '/newsletter',         to: 'pages#newsletter'
  get '/privacy',            to: 'pages#privacy'
  get '/help',               to: 'pages#help'
  get '/thank-you',          to: 'pages#thank-you'
  get '/already-subscribed', to: 'pages#already-subscribed'

  get '/advertising',        to: 'sales#advertising'

  # Having a problem dealing with a form in Capybara.
  # Might test this in rspec instead.
  # match '/scripts/addlead.pl',:to => 'pages#thank-you'

  devise_for :members, controllers: { registrations: 'registrations' }

  # Needs a controller...
  resources :members

  # After the user is authenticated, reroute
  # to his or her profile.
  # But this isn't working in Cucumber...
  #=begin
  namespace :member do
    root to: 'members#show'
  end
  #=end
  # match 'members/:id' => 'members#show', :as => 'member_root'
  # match '/members/:id', :to => redirect {|params| "/#{params[:membername]}" }

  resources :profiles
  resources :projects

  resources :sitemaps, only: :index
  # match '/sitemap', :to => '/sitemap.xml', :controller => 'sitemaps'
end
