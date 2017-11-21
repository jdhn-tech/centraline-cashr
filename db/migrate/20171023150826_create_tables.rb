class CreateTables < ActiveRecord::Migration[5.1]
	def change
		create_table :tables do |t|
			t.integer :table_number, :table_capacity, :floor_number
			t.boolean :occupied
			t.boolean :terrace
			t.boolean :smoker
			t.boolean :active
			t.timestamps
		end
	end
end
