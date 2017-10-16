class Admin::DashboardController < ApplicationController
	def index
		@menus = Menu.all
		@articles = Article.all
		@categories = Category.all
	end
	def createMenu
		@menu = Menu.new()
	end
end
