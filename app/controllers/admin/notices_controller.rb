class Admin::NoticesController < Admin::AdminController
	def index
		@notices = Notice.all
	end
	def create
		@notice = Notice.new
		@notice.description = params[:description]
		@notice.save
		
		redirect_to "/admin/notices" and return
	end
end
