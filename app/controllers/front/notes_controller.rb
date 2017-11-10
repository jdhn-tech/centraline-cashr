class Front::NotesController < ApplicationController
	def create
		@my_note = Note.new
		@my_note.table_id = params[:table_id]
		articles = params[:articles].split(";")
		@my_note.menu_ids = Menu.where('code in (?)', articles).map{|a| a.id.to_s}.compact
		@my_note.article_ids = Article.where('code in (?)', articles).map{|a| a.id.to_s}.compact
		begin
			@my_note.save
			render :json => {:success => true, :note_id => @my_note.id}.to_json
		rescue
			@my_note = nil
			render :json => {:success => false, :note_id => 0}.to_json
		end
	end
end
