class Admin::AdminController < ApplicationController
	layout 'admin'
	http_basic_authenticate_with :name => "demo", :password => "demo", only: :index
end
