class Admin::DashboardController < ApplicationController
	def index
		@tables = Table.all
		@menus = Menu.all
		@articles = Article.all
		@categories = Category.all
	end
end
