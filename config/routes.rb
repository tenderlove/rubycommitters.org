Rubycommitters::Application.routes.draw do
  
  resources :accounts do 
    get 'filter/:query' => 'accounts#filter', :on => :collection, 
  end
  root :to => 'accounts#index'
end
