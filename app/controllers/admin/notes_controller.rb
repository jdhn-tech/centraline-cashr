class Admin::NotesController < Admin::AdminController
	def index
		@notes = Note.all
	end
end
