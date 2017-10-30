class CreateNotes < ActiveRecord::Migration[5.1]
	def change
		create_table :notes do |t|
			t.integer :value
			t.currency :string
			t.timestamps
		end
	end
end
