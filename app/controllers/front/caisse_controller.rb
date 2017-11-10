class Front::CaisseController < ApplicationController
	def tables
		@tables = Table.all
	end
	def table_detail
		@table = Table.find(params[:id])
		@menus = Menu.all
		@articles = Article.all
	end
	def edition_liste
		@note = Note.find(params[:id])
	end
	def edition_client
	end
	def encaisser
		@note = Note.find(params[:id])
	end
	def annulation
	end

	def takeaway_detail
		@menus = Menu.all
		@articles = Article.all
	end

	# Method calls
	def table_add_seat
		Seat.create(:table_id => params[:id])
	end
end
