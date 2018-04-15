class Article < ApplicationRecord
	belongs_to :category
	has_many :note_entries
	validates :code, presence: true, uniqueness: true
	validates :name, presence: true
	validates :price, presence: true

	def getTTCvalue
		return (price)
	end

	def getHTvalue
		return (price / (1+(category.vat/100)))
	end

	def getVAT
		return (category.vat)
	end
end