class Admin::TablesController < Admin::AdminController
	def index
		@tables = Table.all
	end

	def create
		table = Table.new
		table.table_number = Table.count
		table.occupied = false
		table.save
		redirect_to "/admin/tables"
	end
	
	def delete
		my_table = Table.find(params[:id])
		if my_table.occupied
			redirect_to "/admin/tables", notice: "Vous ne pouvez pas enlever une table occupée"
			return
		end
		my_table.destroy
		redirect_to "/admin/tables"
	end
end
