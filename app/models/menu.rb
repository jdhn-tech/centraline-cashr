class Menu < ApplicationRecord

	validates :code, presence: true, uniqueness: true
	validates :name, presence: true
	validates :price, presence: true
	has_many :articles

end