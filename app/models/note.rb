class Note < ApplicationRecord
	has_many :tickets
	def getMenus
		tab = []
		self.menu_ids.each do |id|
			tab << Menu.find(id)
		end
		return tab.compact
	end
	def getArticles
		tab = []
		self.article_ids.each do |id|
			tab << Article.find(id)
		end
		return tab.compact
	end
	def get_remaining_due
		return (self.value - self.tickets.map(&:value).sum)
	end
end
