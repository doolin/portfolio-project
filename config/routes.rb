PortfolioProject::Application.routes.draw do

  # The priority is based upon order of creation:
  # first created -> highest priority.



  # All non-logged in users go to sales page.
  root :to => "sales#index"

  match '/contact',           :to => 'pages#contact' 
  match '/about',             :to => 'pages#about'
  match '/terms',             :to => 'pages#terms'
  match '/disclaimer',        :to => 'pages#disclaimer'
  match '/disclosure',        :to => 'pages#disclosure'
  match '/privacy',           :to => 'pages#privacy'
  match '/help',              :to => 'pages#help'
  match 'thank-you',          :to => 'pages#thank-you'
  match 'already-subscribed', :to => 'pages#already-subscribed'
  
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

  # Sample of regular route:
  #   match 'products/:id' => 'catalog#view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   match 'products/:id/purchase' => 'catalog#purchase', :as => :purchase
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Sample resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Sample resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Sample resource route with more complex sub-resources
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', :on => :collection
  #     end
  #   end

  # Sample resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end

end
