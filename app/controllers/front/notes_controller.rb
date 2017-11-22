class Front::NotesController < ApplicationController
	def create_takeaway # creates and redirects on takeaway page for edition
		my_note = Note.new
		my_note.table_number = 0
		my_note.value = 0
		my_note.active = true
		my_note.state = ""
		my_note.currency = "Euro"
		my_note.reference = "EMP-" + Time.now.to_f.to_s
		my_note.save
		redirect_to "/front/takeaway_detail/" + my_note.id
	end
	def update_note
		my_note = Note.find params[:note_id]
		elements = params[:articles].split(";")
		my_note.value = 0
		elements.each do |e|
			if (Menu.exists?(code: e))
				my_menu = Menu.find_by(code: e)
				my_note.menu_ids << my_menu.id
				my_note.value += my_menu.price

			end
			if (Article.exists?(code: e))
				my_article = Article.find_by(code: e)
				my_note.article_ids << my_article.id
				my_note.value += my_article.price
			end
		end
		my_note.menu_ids.sort!
		my_note.article_ids.sort!
		my_note.save
	end
end
