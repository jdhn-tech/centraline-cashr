class Admin::ArticlesController < Admin::AdminController
	def index
		@articles = Article.all
	end
end
