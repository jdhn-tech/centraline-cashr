Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  # Root path is in front
  root to: "front/caisse#tables"
  get "/front/caisse" => "front/caisse#tables"
  get "/front/emporter" => "front/caisse#emporter"
  get "/front/delivery" => "front/caisse#delivery"
  
  get "/front/edition_client/:id" => "front/caisse#edition_client"
  get "/front/encaisser/:id" => "front/caisse#encaisser"
  get "/front/edition_liste/:id" => "front/caisse#edition_liste"
  get "/front/:table_id/debarasser/:note_id" => "front/caisse#debarasser"
  get "/front/annulation/:id" => "front/caisse#annulation"
  get "/front/table_detail/:id" => "front/caisse#table_detail"
  get "/front/takeaway_detail/:noteId" => "front/caisse#takeaway_detail"

  # Method calls
  get "/front/table_add_seat/:id" => "front/caisse#table_add_seat"
  get "/front/takeaway/create" => "front/notes#create_takeaway"
  get "/front/get_code/:code" => "front/caisse#get_code"
  post "/front/notes/create" => "front/notes#create"
  post "/front/notes/:id/create_ticket" => "front/notes#create_ticket"
  get "/front/notes/:id/create_entry/:code" => "front/notes#create_entry"
  get "/front/notes/:id/clone_entry/:entry_id" => "front/notes#clone_entry"
  get "/front/notes/:id/remove_entry/:entry_id" => "front/notes#remove_entry"
  post "/front/entry/:id/create_notice" => "front/notes#create_notice"
  get "/add_table" => "front/tables#add_table"
  get "/del_table/:id" => "front/tables#del_table"
  
  
  namespace :admin do
    root to: "dashboard#index"
    get "/dashboard" => "dashboard#index"

    # Method calls
    

    resources :tables, :categories, :articles, :menus, :notes, :clients
  end
end
