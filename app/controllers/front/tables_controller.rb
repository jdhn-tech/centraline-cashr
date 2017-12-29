class Front::TablesController < ApplicationController
	def wipe_table
		my_table = Table.find(params[:id])
		my_note = Note.where(table_number: my_table.table_number, active: true, state: "ACTIVE").first
		my_table.occupied = false
		my_note.state = "PAYUP"
		begin
			my_table.save
			my_note.save
		rescue
			my_table.reload.save
			my_note_reload.save
		end
	end
	def add_table
		table = Table.new
		table.table_number = Table.count
		table.occupied = false
		table.save
		redirect_to "/front/table_detail/"+table.id.to_s
	end
	def del_table
		table = Table.find(params[:id])
		activeNotes = Note.where(table_number: table.table_number, active: true)
		if !table.occupied && activeNotes.nil?
			table.destroy
		end
		redirect_to "/"
	end
end
