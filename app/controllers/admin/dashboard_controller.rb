class Admin::DashboardController < ApplicationController
	http_basic_authenticate_with :name => "demo", :password => "demo", only: :index
	def index
		@admin = true
		@tables = Table.all
		@menus = Menu.all
		@articles = Article.all
		@categories = Category.all
		@activeNotes = Note.where(active: true)
	end
	def add_table
		table = Table.new
		table.table_number = Table.count
		table.occupied = false
		table.save
		redirect_to "/admin/dashboard"
	end
	def del_table
		table = Table.find(params[:id])
		activeNotes = Note.where(table_number: table.table_number, active: true)
		if !table.occupied && activeNotes.nil?
			table.destroy
		end
		redirect_to "/admin/dashboard"
	end
end
