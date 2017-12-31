class Admin::MenusController < Admin::AdminController
	def index
		@menus = Menu.all
	end
	def create
		@menu = Menu.new
		my_category = Category.find_by(name: "menu")
		@menu.code = my_category.code+(my_category.menus.count+1).to_s.rjust(2,"0")
		@menu.name = params[:name]
		@menu.price = params[:price].to_i*100
		@menu.save!
		redirect_to "/admin/menus" and return
	end
end
