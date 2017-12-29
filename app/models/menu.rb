class Menu < ApplicationRecord
	belongs_to :category
	has_many :menu_articles
	validates :code, presence: true, uniqueness: true
	validates :name, presence: true
	validates :price, presence: true

	def get_articles
		return Article.where('id IN (?)', self.article_ids)
	end

end