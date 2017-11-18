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
