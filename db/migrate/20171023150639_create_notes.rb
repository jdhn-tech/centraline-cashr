class CreateNotes < ActiveRecord::Migration[5.1]
	def change
		create_table :notes do |t|
			t.integer :value
			t.string :currency
			t.text :table_ids, array: true, default: []
			t.text :menu_ids, array: true, default: []
			t.text :article_ids, array: true, default: []
			t.timestamps
		end
	end
end
