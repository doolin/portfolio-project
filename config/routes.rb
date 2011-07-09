PortfolioProject::Application.routes.draw do

  # The priority is based upon order of creation:
  # first created -> highest priority.

  # All non-logged in users go to sales page.
  root :to => "sales#index"

  get "sales/index"
  get "sales/new"
  get "sales/create"
  get "sales/show"
  get "sales/destroy"
  get "sales/update"
  get "sales/edit"

  match '/contact',    :to => 'pages#contact' 
  match '/about',      :to => 'pages#about'
  match '/terms',      :to => 'pages#terms'
  match '/disclaimer', :to => 'pages#disclaimer'
  match '/disclosure', :to => 'pages#disclosure'
  match '/privacy',    :to => 'pages#privacy'
  match '/help',       :to => 'pages#help'

  devise_for :members, :controllers => { :registrations => "registrations" }

  # Needs a controller...
  resources :members
  #match '/members/:id', :to => redirect {|params| "/#{params[:membername]}" }
  resources :profiles
  resources :projects
  resources :sales

  # After the user is authenticated, reroute
  # to his or her project list.
  # But this isn't working...
  #  namespace :member do
  #    root :to => "projects#index"
  #  end
 
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
