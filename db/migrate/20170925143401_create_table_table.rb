class CreateTableTable < ActiveRecord::Migration[5.1]
	def change
		create_table :tables do |t|
			t.integer :table_number
			t.integer :table_capacity
			t.integer :floor_number
			t.boolean :terrace
			t.boolean :smoker
		end
	end
end
