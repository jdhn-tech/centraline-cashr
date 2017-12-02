class Front::CaisseController < ApplicationController
	def tables
		@tables = Table.all.sort
	end
	def table_detail
		@table = Table.find(params[:id])
		if @table.occupied
			@note = Note.where(table_number: @table.table_number, active: true, state: "ACTIVE").first
		else
			@note = Note.new
			@note.table_number = @table.table_number
			@note.active = true
			@note.value = 0
			@note.reference = "T" + @table.table_number.to_s + "-" + Time.now.to_f.to_s
			@note.currency = "Euro"
			@note.state = "ACTIVE"
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
		@notes=Note.all
	end
	def encaisser
		@note = Note.find(params[:id])
		@payment_types = Payment.all
	end
	def annulation
		@table = Table.find(params[:id])
		@note = Note.where(table_number: @table.table_number, active: true).first
		@table.occupied = false
		@note.active = false
		@table.save
		@note.save
	end

	def emporter
		@notes = Note.where(table_number: 0, active: true).compact
	end
	def takeaway_detail
		@table = Table.find_by_table_number(0)
		@note = Note.find(params[:noteId])
		@menus = Menu.all
		@articles = Article.all
	end

	# Method calls
	def table_add_seat
		Seat.create(:table_id => params[:id])
	end
	def get_code
		menu = Menu.where(code: params[:code]).first
		article = Article.where(code: params[:code]).first
		if !menu.nil?
			render :json => {:success => true, :code => menu.code,:name => menu.name, :price => menu.price}.to_json
		elsif !article.nil?
			render :json => {:success => true, :code => article.code,:name => article.name, :price => article.price}.to_json
		else
			render :json => {:success => false}.to_json
		end	
	end
end
