class Article < ApplicationRecord
	belongs_to :category
	has_many :note_entries
	validates :code, presence: true, uniqueness: true
	validates :name, presence: true
	validates :price, presence: true

	def getTTCvalue
		return (self.price)
	end

	def getHTvalue
		return (self.price / (1+(self.category.vat/100)))
	end
end