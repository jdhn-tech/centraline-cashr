class Admin::TablesController < ApplicationController
	def new
		@table = Table.new.init
	end
	def create
		if params[:table][:no_region] == "1"
			params[:table][:place] = ""
			params[:table][:radius] = nil
		end
		@table = Table.new params[:table]
		if @table.save
			redirect_to admin
		else
			render :action => :new
		end
	end
end
