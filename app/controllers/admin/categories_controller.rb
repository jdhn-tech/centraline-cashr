class Admin::CategoriesController < Admin::AdminController
	def index
		@categories = Category.all
	end
	def create
		@category = Category.new()
		@category.code = params[:code]
		@category.name = params[:name]
		@category.vat = params[:vat].to_f
		@category.save
		redirect_to "/admin/categories"
	end
end
