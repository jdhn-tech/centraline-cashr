class Front::CaisseController < ApplicationController
	def tables
		@tables = Table.all
	end
	def table_detail
		@table = Table.find(params[:id])
		if @table.occupied
			@note = Note.where(table_id: params[:id], active: true).first
		else
			@note = Note.new
			@note.table_id = params[:id]
			@note.active = true
			@note.value = 0
			@note.currency = "Euro"
			@note.save
			@table.occupied = true
			@table.save
		end
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

	def emporter
		@notes = Note.where(table_id: 1, active: true).compact
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
