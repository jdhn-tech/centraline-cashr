class Ticket < ApplicationRecord
	belongs_to :note
	has_many :note_entries
end
