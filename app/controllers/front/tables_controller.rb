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
end
