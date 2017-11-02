class CreateTickets < ActiveRecord::Migration[5.1]
	def change
		create_table :tickets do |t|
			t.integer :value
			t.string :currency
			t.timestamps
		end
	end
end
