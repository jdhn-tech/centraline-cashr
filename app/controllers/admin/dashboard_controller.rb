class Admin::DashboardController < ApplicationController
	def index
		@tables = Table.all
		@menus = Menu.all
		@articles = Article.all
		@categories = Category.all
	end
	def add_table
		Table.create(:table_number => Table.count + 1)
		redirect_to (:back) 
	end
	def del_table(id)
		Table.find(id).destroy
	end
end
