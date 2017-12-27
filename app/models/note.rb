class Note < ApplicationRecord
	has_many :note_entries
	has_many :tickets
	def getUnpaidNoteEntries
		all_entry_ids = self.note_entries.map(&:id)
		paid_entry_ids = self.tickets.map(&:note_entry_list).reject(&:empty?).join(";").split(";").map{|id| id.to_i}
		return (NoteEntry.where('id in (?)', all_entry_ids - paid_entry_ids))
	end
	def getUnpaidAverageSplit
		paid_average_splits = self.tickets.select{|ticket| ticket if !ticket.average_split.empty?}
		return nil if paid_average_splits
		all_average_splits = paid_average_splits.first.average_split
		# remaining_average_splits = 
		return
	end
	def getMenus
		tab = []
		self.menu_ids.each do |id|
			tab << Menu.find(id)
		end
		return tab.compact
	end
	def getArticles
		tab = []
		self.article_ids.each do |id|
			tab << Article.find(id)
		end
		return tab.compact
	end
	def getTotal
		self.note_entries.map(&:value).sum
	end
	def get_remaining_due
		return (self.getTotal - self.tickets.map(&:value).sum)
	end
end
