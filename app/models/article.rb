class Article < ApplicationRecord

	validates :code, presence: true, uniqueness: true
	validates :name, presence: true
	validates :price, presence: true
	has_many :categories

end