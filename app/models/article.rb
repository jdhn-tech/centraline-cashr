class Article < ApplicationRecord
	belongs_to :category
	validates :code, presence: true, uniqueness: true
	validates :name, presence: true
	validates :price, presence: true
end