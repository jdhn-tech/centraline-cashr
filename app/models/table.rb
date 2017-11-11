class Table < ApplicationRecord

	validates :table_number, :presence => true, :uniqueness => true

	has_many :seats

	def getActiveNote
		# return Note.where()
	end
	
end