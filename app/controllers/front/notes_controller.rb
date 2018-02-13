class Front::NotesController < ApplicationController
	def create_takeaway # creates and redirects on takeaway page for edition
		my_note = Note.new
		my_note.table_number = 0
		my_note.value = 0
		my_note.active = true
		my_note.state = "EN_COURS"
		my_note.currency = "Euro"
		my_note.reference = "EMP-" + DateTime.now.strftime("%d-%m-%Y-%H:%M")
		my_note.save
		redirect_to "/front/takeaway_detail/" + my_note.id.to_s
	end
	def create_ticket
		my_note = Note.find(params[:id])
		if my_note.state == "FULLY_PAID"
			render :json => {:success => false, :message => ""} 
			return
		end
		my_ticket = Ticket.new
		my_ticket.init
		my_ticket.note_id = params[:id]
		my_ticket.value = params[:paid]
		params[:ticket_info].split(";").map{|info|
			if info.match('entry')
				my_ticket.note_entry_list += (my_ticket.note_entry_list == "") ? info.gsub("entry", "") : ";"+info.gsub("entry", "")
			elsif info.match('moyenne')
				my_ticket.average_split+= (my_ticket.average_split == "") ? info.gsub("moyenne", "") : ";"+info.gsub("moyenne", "")
			end
		}
		paymentMethods = params.select{ |key, value|
			if (key.match("method_"))
				paymentMethodId = Payment.find_by(name: key.gsub("method_", "")).id
				my_ticket.payment_methods += (my_ticket.payment_methods == "") ? paymentMethodId.to_s+":"+value.to_s : ";"+paymentMethodId.to_s+":"+value.to_s
			end
		}
		my_ticket.save
		if my_note.get_remaining_due <= 0
			my_note.state = "FULLY_PAID"
			my_note.save
		else
			my_note.state = "INCOMPLETE_PAYMENT"
			my_note.save
		end
		render :json => {:success => true, :infos => my_ticket}.to_json
	end
	def create_notice
		my_entry = NoteEntry.find(params[:id])
		my_entry.notices << params[:notice].to_s
		my_entry.save
		render :json => {:success => true, :notices => my_entry.notices.join(" ; ")}.to_json
	end
	def create_entry
		my_note = Note.find(params[:id])
		if my_note.state == "FULLY_PAID" || my_note.state == "INCOMPLETE_PAYMENT"
			render :json => {:success => false, :message => "impossible de modifier une commande encaissée"}
			return
		end
		my_entry = NoteEntry.new
		if my_entry.nil?
			render :json => {:success => false}.to_json
			return
		end
		my_entry.note_id = params[:id]
		my_entry.status = "NEW"
		if (Menu.exists?(code: params[:code]))
			my_menu = Menu.find_by(code: params[:code])
			my_entry.menu_id = my_menu.id
			my_entry.value = my_menu.getTTCvalue
			my_entry.save
			render :json => {
				:success => true,
				:entry_id => my_entry.id,
				:code => my_menu.code,
				:name => my_menu.name,
				:price => my_menu.price,
				:status => my_entry.status,
				:notice => my_entry.notices
			}.to_json
			return
		elsif (Article.exists?(code: params[:code]))
			my_article = Article.find_by(code: params[:code])
			my_entry.article_id = my_article.id
			my_entry.value = my_article.getTTCvalue
			my_entry.save
			render :json => {
				:success => true,
				:entry_id => my_entry.id,
				:code => my_entry.getCode,
				:name => my_entry.getName,
				:price => my_entry.value,
				:status => my_entry.status,
				:notice => my_entry.notices
			}.to_json
			return
		end
		render :json => {:success => false}.to_json
	end
	def clone_entry
		my_entry = NoteEntry.find(params[:entry_id])
		my_note = my_entry.note
		if my_note.state == "FULLY_PAID" || my_note.state == "INCOMPLETE_PAYMENT"
			render :json => {:success => false, :message => "impossible de modifier une commande encaissée"}
			return
		end
		
		if my_entry.nil?
			render :json => {:success => false}.to_json
			return
		end
		new_entry = NoteEntry.new
		new_entry.note_id = my_entry.note_id
		new_entry.article_id = my_entry.article_id
		new_entry.menu_id = my_entry.menu_id
		new_entry.value = my_entry.value
		new_entry.status = my_entry.status
		# new_entry.notices = my_entry.notices
		new_entry.save
		render :json => {
			:success => true,
			:entry_id => new_entry.id,
			:code => new_entry.getCode,
			:name => new_entry.getName,
			:price => new_entry.value,
			:status => new_entry.status,
			:notice => new_entry.notices
		}.to_json
	end
	def remove_entry
		my_entry = NoteEntry.find(params[:entry_id])
		my_note = my_entry.note
		if my_note.state == "FULLY_PAID" || my_note.state == "INCOMPLETE_PAYMENT"
			render :json => {:success => false, :message => "impossible de modifier une commande encaissée"}
			return
		end
		if my_entry.destroy.nil?
			render :json => {:success => false}.to_json
		else
			render :json => {:success => true}.to_json
		end
	end
end
