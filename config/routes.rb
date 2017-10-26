Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace :front do
    get "waiter" => "waiter#index"
    get "caisse" => "caisse#tables"
    get "emporter" => "caisse#emporter"
    get "table_detail" => "caisse#table_detail"
    get "table_detail_bis" => "caisse#table_detail_bis"
    get "edition_liste" => "caisse#edition_liste"
    get "edition_client" => "caisse#edition_client"
    get "encaisser" => "caisse#encaisser"
    get "annulation" => "caisse#annulation"
  end
  namespace :admin do
  	root to: "dashboard#index"
  	resources :tables, :categories, :articles, :menus, :notes
  end
end
