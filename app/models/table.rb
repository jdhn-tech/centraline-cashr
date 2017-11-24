class Table < ApplicationRecord

	validates :table_number, :presence => true, :uniqueness => true

	def getActiveNote
		return self.active ? Note.where(table_id: self.id, active: true) : null
	end
	
end