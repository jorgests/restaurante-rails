Rails.application.routes.draw do
  resources :comentarios

  resources :qualificacoes

  resources :clientes

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'
  # get 'hello_world' => 'hello_world#index'

  # get 'jorge', to: proc{ |env| [200,{"Content-Type" => "text/html"} ,["Ola Jorge tu e foda"] ] }
  # match 'jorge2', to: proc{ |env| [200,{"Content-Type" => "text/html"} ,["Ola Jorge tu e foda"] ] }, via: :get

  resources :restaurantes do
    collection do
      get 'por-nome/:nome' => 'restaurantes#by_name', as: 'por_nome'
    end

    member do
      get 'abrir' => 'restaurantes#open'
      get 'fechar' => 'restaurantes#close'
    end
  end
  # Ira gerar:
  # get 'restaurantes' => 'restaurantes#index'
  # get 'restaurantes' => 'restaurantes#new'
  # post 'restaurantes' => 'restaurantes#create'
  # get 'restaurantes/:id' => 'restaurantes#show'

# routes
  # match 'restaurantes/:nome', :controller => 'restaurantes', :action => 'show'

# pretty URLs


# Named Routes
  # match 'restaurantes/:nome' => 'restaurantes#index', :via: [:get, :post]

  # match 'restaurantes', to: 'restaurantes#index', via: :all
  # match 'restaurantes', to: 'restaurantes#new', via: :all
  # match 'restaurantes', to: 'restaurantes#create', via: :all
  # match 'restaurantes', to: 'restaurantes#show', via: :all
  # match 'restaurantes', to: 'restaurantes#edit', via: :all
  # match 'restaurantes', to: 'restaurantes#destroy', via: :all


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
