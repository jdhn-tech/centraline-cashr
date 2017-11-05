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
	end
	def edition_client
	end
	def encaisser
	end
	def annulation
	end

	def takeaway_detail
	end

	# Method calls
	def table_add_seat
		Seat.create(:table_id => params[:id])
	end
end
