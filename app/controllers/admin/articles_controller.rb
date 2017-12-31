class Admin::ArticlesController < Admin::AdminController
	def index
		@articles = Article.all
	end
	def create
		@article = Article.new
		my_category = Category.find(params[:category])
		@article.code = my_category.code+(my_category.articles.count+1).to_s.rjust(2,"0")
		@article.name = params[:name]
		@article.category_id = params[:category].to_i
		@article.price = params[:price].to_i*100
		@article.save
		redirect_to "/admin/articles"
	end
end
