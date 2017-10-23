class Table < ApplicationRecord

	validates :number, presence: true, uniqueness: true
	validates :name, presence: true
	validates :price, presence: true
	has_many :categories

end