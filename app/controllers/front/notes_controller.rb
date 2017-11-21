class Front::NotesController < ApplicationController
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
