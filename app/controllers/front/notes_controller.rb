class Front::NotesController < ApplicationController
	def create_takeaway # creates and redirects on takeaway page for edition
		my_note = Note.new
		my_note.table_number = 0
		my_note.value = 0
		my_note.active = true
		my_note.state = "EN_COURS"
		my_note.currency = "Euro"
		my_note.reference = "EMP-" + Time.now.to_f.to_s
		my_note.save
		redirect_to "/front/takeaway_detail/" + my_note.id.to_s
	end
	def create_ticket
		my_ticket.note_id = params[:id]
		# my_ticket.entry_ids = 
	end
	def create_notice
		my_entry = Entry.find(params[:id])
		my_entry.note_ids << params[:message]
		my_entry.save
		render :json => {:success => true}.to_json
	end
	def create_entry
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
			my_entry.value = my_menu.price
			my_entry.save
			render :json => {
				:success => true,
				:entry_id => my_entry.id,
				:code => my_menu.code,
				:name => my_menu.name,
				:price => my_menu.price,
				:status => my_entry.status,
				:notice => my_entry.notice
			}.to_json
			return
		elsif (Article.exists?(code: params[:code]))
			my_article = Article.find_by(code: params[:code])
			my_entry.article_id = my_article.id
			my_entry.value = my_article.price
			my_entry.save
			render :json => {
				:success => true,
				:entry_id => my_entry.id,
				:code => my_article.code,
				:name => my_article.name,
				:price => my_article.price,
				:status => my_entry.status,
				:notice => my_entry.notice
			}.to_json
			return
		end
		render :json => {:success => false}.to_json
		return
	end
	def clone_entry

	end
	def remove_entry
		Entry.find(params[:entry_id]).destroy
		render :json => {:success => true}.to_json
	end
end
