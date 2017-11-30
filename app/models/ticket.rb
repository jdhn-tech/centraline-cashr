class Ticket < ApplicationRecord
	belongs_to :note
	has_many :note_entries
	def getMenus
		table = []
		self.menu_ids.each do |id|
			table << Menu.find(id)
		end
		return table.compact
	end
	def getArticles
		table = []
		self.article_ids.each do |id|
			table << Article.find(id)
		end
		return table.compact
	end
end
