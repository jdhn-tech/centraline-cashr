class Note < ApplicationRecord
	belongs_to :table
	def getMenus
		table = []
		self.menu_ids.each do |id|
			table << Menu.find(id)
		end
		return table
	end
	def getArticles
		table = []
		self.article_ids.each do |id|
			table << Article.find(id)
		end
		return table
	end
end
