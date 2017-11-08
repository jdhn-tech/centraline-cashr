class CreateNotes < ActiveRecord::Migration[5.1]
	def change
		create_table :notes do |t|
			t.integer :value
			t.string :currency
			t.integer :platform
			t.text :menu_ids, array: true, default: []
			t.text :article_ids, array: true, default: []
			t.text :notices, array: true, default: []
			t.string :state
			t.boolean :active
			t.timestamps
		end
	end
end
