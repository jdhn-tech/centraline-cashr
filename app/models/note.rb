class Note < ApplicationRecord
	has_many :note_entries
	has_many :tickets
	# states can be either ACTIVE INCOMPLETE_PAYMENT FULLY_PAID
	# for takeaway : EN_COURS
	def getUnpaidNoteEntries
		all_entry_ids = self.note_entries.map(&:id)
		paid_entry_ids = self.tickets.map(&:note_entry_list).reject(&:empty?).join(";").split(";").map{|id| id.to_i}
		return (NoteEntry.where('id in (?)', all_entry_ids - paid_entry_ids))
	end
	def getUnpaidAverageSplit
		paid_average_splits = self.tickets.select{|ticket| ticket if !ticket.average_split.empty?}
		return nil if paid_average_splits.empty?
		average_split_number = paid_average_splits.first.average_split.split(";").first.split("/").second
		average_split_paids = paid_average_splits.map(&:average_split).reject(&:empty?).join(";").split(";").map{|e|e.first}
		average_price = paid_average_splits.first.value / paid_average_splits.first.average_split.split(";").count
		remaining_average_splits = []
		structure_name = "Panier Moyen sur "+average_split_number+" personne"
		for i in 1..average_split_number.to_i
			if !average_split_paids.include? i.to_s
				remaining_average_splits << {"id" => "moyenne"+i.to_s+"/"+average_split_number, "code" => i.to_s, "name" => structure_name, "value" => average_price}
			end
		end
		return remaining_average_splits
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
		return self.note_entries.map(&:value).sum
	end
	def get_remaining_due
		return (self.getTotal - self.tickets.map(&:value).sum)
	end
	def getCommandInfos
		infos=[]
		self.tickets.each do |ticket|
			my_methods = ticket.payment_methods.split(";")
			my_ticket = []
			my_methods.each do |my_method|
				my_ammount = (my_method.split(":").last.to_f / 100).to_s
				my_payment = Payment.find(my_method.split(":").first).name
				my_ticket << my_ammount+"€ en "+my_payment
			end
			infos << my_ticket
		end
		return infos
	end
	def getUnpaidNotes
		where('state in (?)', %(ACTIVE INCOMPLETE_PAYMENT))
	end
	def state_in_french
		case self.state
		when "ACTIVE"
			return "Non réglé"
		when "INCOMPLETE_PAYMENT"
			return "Paiement incomplet"
		when "FULLY_PAID"
			return "Totalement réglé"
		when "EN_COURS"
			return "En cours de préparation"
		end
	end
end
