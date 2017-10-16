Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace :front do
    get "waiter" => "waiter#index"
  end
  namespace :admin do
  	root to: "dashboard#index"
  end
end
