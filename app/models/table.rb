class Table < ApplicationRecord

	validates :table_number, :presence => true, :uniqueness => true

	def init
		self.table_number = Table.count + 1
	end

	def seats
		return (Seat.where(:table_id => self.id))
	end
end