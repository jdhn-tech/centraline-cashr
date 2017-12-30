class Admin::DashboardController < Admin::AdminController
	def index
		@admin = true
		@tables = Table.all
		@menus = Menu.all
		@articles = Article.all
		@categories = Category.all
		@activeNotes = Note.where(active: true)
	end
end
