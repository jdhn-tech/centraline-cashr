Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  # Root path is in front
  root to: "front/caisse#tables"
  get "/front/caisse" => "front/caisse#tables"
  get "/front/emporter" => "front/caisse#emporter"
  get "/front/edition_client" => "front/caisse#edition_client"
  
  get "/front/encaisser/:id" => "front/caisse#encaisser"
  get "/front/edition_liste/:id" => "front/caisse#edition_liste"
  get "/front/annulation/:id" => "front/caisse#annulation"
  get "/front/table_detail/:id" => "front/caisse#table_detail"
  get "/front/takeaway_detail/:noteId" => "front/caisse#takeaway_detail"

  # Method calls
  get "/front/table_add_seat/:id" => "front/caisse#table_add_seat"
  post "/front/notes/create" => "front/notes#create"
  get "/front/notes/update/:id" => "front/notes#update_note"
  get "/front/takeaway/create" => "front/notes#create_takeaway"
  get "/front/get_code/:code" => "front/caisse#get_code"

  namespace :front do
    resources :tables
  end

  # Admin contains no root path
  get "/admin/dashboard" => "admin/dashboard#index"

  # Method calls
  get "/admin/add_table" => "admin/dashboard#add_table"
  get "/admin/del_table/:id" => "admin/dashboard#del_table"
  
  namespace :admin do
  	resources :tables, :categories, :articles, :menus, :notes
  end
end
