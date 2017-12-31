class Admin::MenusController < Admin::AdminController
	def index
		@menus = Menu.all
	end
	def create
		@menu = Menu.new
		my_category = Category.find_by(name: "menu")
		@menu.code = my_category.code+(my_category.menus.count+1).to_s.rjust(2,"0")
		@menu.category_id = my_category.id
		@menu.name = params[:name]
		@menu.price = params[:price].to_i*100
		@menu.save
		MenuSection.all.map(&:id).each do |sectionId|
			params[sectionId.to_s].each do |articleId|
				tmp_menu_article = MenuArticle.new
				tmp_menu_article.menu_id = @menu.id
				tmp_menu_article.menu_section_id = sectionId
				tmp_menu_article.article_id = articleId
				tmp_menu_article.save
			end unless params[sectionId.to_s].nil?
		end
		
		redirect_to "/admin/menus" and return
	end
end
