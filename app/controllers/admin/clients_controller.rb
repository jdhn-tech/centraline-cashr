class Admin::ClientsController < Admin::AdminController
	def index
		@clients = Client.all
	end
end
