PortfolioProject::Application.routes.draw do

  get "pages/contact"

  get "pages/disclaimer"

  get "pages/disclosure"

  get "pages/terms"

  get "pages/about"

  get "pages/privacy"

#=begin
  
  get "sales/index"

  get "sales/new"

  get "sales/create"

  get "sales/show"

  get "sales/destroy"

  get "sales/update"

  get "sales/edit"
#=end


  devise_for :members

  # Needs a controller...
  resources :members
  match '/members/:id', :to => redirect {|params| "/#{params[:membername]}" }

  resources :profiles
  
  
  resources :projects
  
  resources :sales

  # After the user is authenticated, reroute
  # to his or her project list.
  # But this isn't working...
#  namespace :member do
#    root :to => "projects#index"
#  end
 
  # All non-logged in users go to sales page.
  root :to => "sales#index"


  # The priority is based upon order of creation:
  # first created -> highest priority.

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

  # You can have the root of your site routed with "root"
  # just remember to delete public/index.html.
  # root :to => "welcome#index"

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id(.:format)))'
end
