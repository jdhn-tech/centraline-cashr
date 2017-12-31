class Menu < ApplicationRecord
	belongs_to :category
	has_many :menu_articles
	validates :code, presence: true, uniqueness: true
	validates :name, presence: true
	validates :price, presence: true

	def getAllArticles
		return self.menu_articles.map{|ma|ma.article}
	end

	def getTTCvalue
		return (self.price)
	end

	def getHTvalue
		return (self.price / (1+(self.category.vat/100))).ceil
	end

end