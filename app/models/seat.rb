class Seat < ApplicationRecord
	belongs_to :table

	def init
		self.occupied = true
	end
end
