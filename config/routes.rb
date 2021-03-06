MarsAttracts::Application.routes.draw do
  
  resources :origins, only: [:index, :show]
  resources :destinations, only: [:index, :show]

  root 'flights#index'
  get '/flights/search' => 'flights#search', as: :flights_search
  get '/passengers' => 'passengers#index', as: :passengers
  get '/amenities' => 'amenities#index', as: :amenities
  get '/mars_weather_temps' => 'mars_weather_temps#index', as: :mars_weather_temps
  get '/earth_weather_temps' => 'earth_weather_temps#index', as: :earth_weather_temps
  get '/mars_weathers' => 'mars_weathers#index', as: :mars_weathers

  resources :flights do
    resources :passengers
  end

  resources :trips

  resources :ships


  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
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

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end
