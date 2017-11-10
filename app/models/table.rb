class Table < ApplicationRecord

	validates :table_number, :presence => true, :uniqueness => true

	has_many :seats

	# def init
	# 	self.table_number = Table.count + 1
	# end
	
end