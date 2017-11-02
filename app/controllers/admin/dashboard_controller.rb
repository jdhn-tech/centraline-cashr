class Admin::DashboardController < ApplicationController
	def index
		@tables = Table.all
		@menus = Menu.all
		@articles = Article.all
		@categories = Category.all
	end
	def add_table
		table = Table.new
		table.table_number = Table.count + 1
		table.save
		redirect_to ('admin')
	end
	def del_table(id)
		Table.find(id).destroy
	end
end
