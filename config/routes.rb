Babystar::Application.routes.draw do
  match 'top', :controller => :top, :action => :index, :via => :get, :as => 'top'
  match 'top/index', :controller => :top, :action => :index, :via => :get, :as => 'top_index'
  match 'top/:theme_id', :controller => :top, :action => :show, :via => :get, :as => 'top_show'

  #1. rootを指定するパターン
  #match '/top/search' , :via => :post

  #2. コントローラとアクションを指定するパターン
  #match "top/search", :controller => :top, :action => :search , :via => :post
  #match "top/create", :controller => :top, :action => :create , :via => :post

  # match "mentions/createBt", :controller => :mentions, :action => :createBt , :via => :post

  resources :users

  resources :mentions do
    post 'create', :on => :collection #:idをpathに含めないために必要
  end

  resources :contributors

  resources :themes do
    get 'new', :on => :collection
    post 'create', :on => :collection
    delete 'delete'
  end

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
  # root :to => 'welcome#index'

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id))(.:format)'
end
