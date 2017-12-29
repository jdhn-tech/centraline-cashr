class Admin::TablesController < Admin::AdminController
	def index
		@tables = Table.all
	end
end
