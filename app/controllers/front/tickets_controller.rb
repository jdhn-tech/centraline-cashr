class Front::TicketsController < ApplicationController
	def create
		@ticket = Ticket.new
		my_note = Note.find(params[:note_id])
		@ticket.note_id = my_note.id
		elements = params[:articles].split(";")
		@ticket.value = 0
		my_menu_ids = []
		my_article_ids = []
		elements.each do |e|
			if (Menu.exists?(code: e))
				my_menu = Menu.find_by(code: e)
				my_menu_ids << my_menu.id
				my_note.value += my_menu.price

			end
			if (Article.exists?(code: e))
				my_article = Article.find_by(code: e)
				my_article_ids << my_article.id
				my_note.value += my_article.price
			end
		end
		@ticket.menu_ids = my_menu_ids.sort
		@ticket.article_ids = my_article_ids.sort
		begin
			@ticket.save
		rescue
			@ticket.reload.save
		ensure
			if (my_note.get_remaining_due <= 0)
				my_note.active = false
				my_note.save
			end
			render :json => {:success => true, :code => 200}.to_json
		end
	end
end
