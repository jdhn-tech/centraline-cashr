class Ticket < ApplicationRecord
	belongs_to :note
	has_many :note_entries
	def init
		self.paid = false
		self.note_entry_list = ""
		self.average_split = ""
		self.currency = "Euro"
		self.payment_methods = ""
		self.average_split = ""
		self.value_split = ""
	end
	def getNoteEntries
		return (self.note_entry_list == "") ? nil : NoteEntry.where('id in (?)', self.note_entry_list.split(";"))
	end
end
