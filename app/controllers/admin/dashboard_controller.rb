class Admin::DashboardController < ApplicationController
	def index
	end
	def createMenu
		@menu = Menu.new()
	end
end
