class Category < ApplicationRecord
	has_many :articles
	has_many :menus
	validates :code, presence: true, uniqueness: true
	validates :name, presence: true
	# def initialize(code, name, vat)
	# 	@code = code
	# 	@name = name
	#	@vat = vat
	# end
end