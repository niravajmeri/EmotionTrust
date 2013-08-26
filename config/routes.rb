EmotionTrust::Application.routes.draw do

  resources :transfer_resources


  resources :player_communications


  resources :player_color_buckets
  resources :cellcolors
  resources :gameboards
  resources :commitments
  resources :trusts
  resources :expectations
  resources :moods
  resources :emotions
  resources :game_rounds
  resources :games
  resources :color_pallets
  resources :colortrails
  resources :gamerounds
  resources :games
  resources :players
  
  get "transfer_resource" => "players#transfer_resource", :as => "transfer_resource"
  
  get "create_player_communication" => "players#create_player_communication", :as => "create_player_communication"
  get "player_communication" => "players#player_communication", :as => "player_communication"
  get "move" => "players#move", :as => "move"

  post "logincheck" => "players#login_check", :as => "logincheck"
  
  post "mood_measure" => "players#mood_measure", :as => "mood_measure"
  get "mood_measure_form" => "players#mood_measure_form", :as => "mood_measure_form"
  
  get "moveajax" => "players#moveajax", :as => "moveajax"
  get "game_board" => "players#game_board", :as => "game_board"
  
  get "player_game_rounds" => "players#player_game_rounds", :as => "player_game_rounds"
  
  get "player_games" => "players#player_games", :as => "player_games"
  get "log_in" => "players#login", :as => "log_in"
  #root :to => "users#new"
  root :to => "players#login"

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
   match ':controller(/:action(/:id))(.:format)'
end
