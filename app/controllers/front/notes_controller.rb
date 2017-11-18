class Front::NotesController < ApplicationController
	def create
		my_note = Note.new
		my_note.table_id = params[:table_id]
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
		begin
			my_note.save
			render :json => {:success => true, :note_id => my_note.id}.to_json
		rescue
			my_note = nil
			render :json => {:success => false, :note_id => 0}.to_json
		end
	end
end
